from rest_framework import viewsets
from rest_framework.filters import SearchFilter,OrderingFilter
from .models import stblCountryCodeType,stblPhoneType,tblCountryCode,tblPhone,stblEntityType,tblEntity,stblAddressType,tblAddress,stblHeadCountType,tblHeadCount,stblEmailType,tblEmail,stblPhotoType,tblPhoto,stblSocialMediaType,tblSocialMedia,stblCompanyType,stblIndustryType,stblSuffixType,stblSocialMediaType,tblSocialMedia,stblCompanyType,stblIndustryType,stblSuffixType,tblEntitySocialMedia,stblPersonType,tblPerson,tblCompany,tblEntityPhone,rtblEntityEmail,rtblEntity,rtblEntityAddress,tblDocument,stblStatus,tblEntityCallDetails,stblSkill,tblEntitySkill
from .serializers import stblCountryCodeTypeSerializer,stblPhoneTypeSerializer,tblCountryCodeSerializer,tblPhoneSerializer,stblEntityTypeSerializer,tblEntitySerializer,stblAddressTypeSerializer,tblAddressSerializer,stblHeadCountTypeSerializer,tblHeadCountSerializer,stblEmailTypeSerializer,tblEmailSerializer,stblPhotoTypeSerializer,tblPhotoSerializer,stblSocialMediaTypeSerializer,tblSocialMediaSerializer,stblCompanyTypeSerializer,stblIndustryTypeSerializer,stblSuffixTypeSerializer,tblEntitySocialMediaSerializer,stblPersonTypeSerializer,tblPersonSerializer,tblCompanySerializer,tblEntityPhoneSerializer,rtblEntityEmailSerializer,rtblEntitySerializer,UserSerializer,rtblEntityAddressSerializer,tblDocumentSerializer,stblStatusSerializer,tblEntityCallDetailsSerializer,stblSkillSerializer,tblEntitySkillSerializer
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User
from django.db.models import Q
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics
import json
import datetime
# import itertools
# from collections.abc import Iterable
from django.utils.datastructures import MultiValueDictKeyError

class tblDocumentViewSet(APIView):
	def get(self,request,pk,*args, **kwargs):
		docs = tblDocument.objects.filter(EntityIDF=pk).first()
		serializer_doc = tblDocumentSerializer(docs,context={"request": request})	
		return Response(serializer_doc.data)	


class CallDetailsViewSet(APIView):
	def get(self,request,pk,*args, **kwargs):
		res_data = []
		tbl_entity = tblEntity.objects.get(EntityID=pk)
		tblEntity_CallDetails = tblEntityCallDetails.objects.filter(EntityIDF=tbl_entity).order_by('-EntityCallDetailsID')
		if tblEntity_CallDetails:
			for Ecall in tblEntity_CallDetails:
				CallDetails_Serializer = tblEntityCallDetailsSerializer(Ecall)
				res_data.append(CallDetails_Serializer.data)
		# print(res_data)		
		return Response(res_data)	

	def delete(self,request,pk,*args, **kwargs):
		tblEntity_CallDetails = tblEntityCallDetails.objects.get(EntityCallDetailsID=pk).delete()
		return Response({'msg':'Data Deleted'})	
		
class tblEntityCallDetailsViewSet(APIView):
	
	def post(self,request,format=None):
		data = request.data
		print(data)
		tbl_entity = tblEntity.objects.get(EntityID=data['EntityID'])
		S = stblStatus.objects.get(Status=data['Status'])
		tblEntity_CallDetails = tblEntityCallDetails(AboutCall=data['AboutCall'],Date=data['date'],CreatedBY=request.user,StatusIDF=S,EntityIDF=tbl_entity)
		tblEntity_CallDetails.save()

		tbl_person = tblPerson.objects.get(EntityIDF=tbl_entity)
		print(tbl_person)
		tbl_person.StatusIDF = S
		tbl_person.UpdatedBy = request.user
		tbl_person.save()

		return Response({'msg':'Data Created'})

class EDetailApi(APIView):
	def get(self,request,pk,*args, **kwargs):
		res_data = {}
		tbl_entity = tblEntity.objects.get(EntityID=pk)
		tbl_entity_serializer = tblEntitySerializer(tbl_entity)
		a = tbl_entity_serializer.data		
		res_data['Entity'] = a


		tbl_Person = tblPerson.objects.filter(EntityIDF=tbl_entity).first()
		if tbl_Person:
			tbl_Person_serializer = tblPersonSerializer(tbl_Person)				
			b1 = tbl_Person_serializer.data

			rtbl_Entity = rtblEntity.objects.filter(PersonIDF=tbl_Person).first()
			# if rtbl_Entity :
			rtbl_Entity_Serializer = rtblEntitySerializer(rtbl_Entity) 	
			b2 = rtbl_Entity_Serializer.data			
			res_data['Person'] = {**b1 ,**b2}

			# res_data['Person'].update(skills_) 
		tbl_Entity_Skill = tblEntitySkill.objects.filter(EntityIDF=tbl_entity)
		skills_ = []
		if tbl_Entity_Skill:
			for s in tbl_Entity_Skill:
				tblEntity_Skill_Serializer = tblEntitySkillSerializer(s)  
				sd = tblEntity_Skill_Serializer.data
				skills_.append(sd)
			res_data['Skill'] = skills_

		tbl_company = tblCompany.objects.filter(EntityIDF=tbl_entity).first()
		if tbl_company:
			tbl_Company_Serializer = tblCompanySerializer(tbl_company)	
			c = tbl_Company_Serializer.data
			res_data['Company'] = c
		
		tbl_Photo = tblPhoto.objects.filter(EntityIDF=tbl_entity).first()
		if tbl_Photo:
			tbl_Photo_Serializer = tblPhotoSerializer(tbl_Photo,context={"request": request})	
			h = tbl_Photo_Serializer.data
			res_data['Photo'] = h
			
		tbl_Entity_address = rtblEntityAddress.objects.filter(EntityIDF=tbl_entity)
		if tbl_Entity_address:
			eAddress = []
			for a in tbl_Entity_address:
				tbl_Address_Serializer = rtblEntityAddressSerializer(a)	
				d = tbl_Address_Serializer.data
				eAddress.append(d)
			res_data['Address'] = eAddress

		tbl_Entity_Phone =tblEntityPhone.objects.filter(EntityIDF=tbl_entity)
		if tbl_Entity_Phone:
			ePhone = []	
			for p in tbl_Entity_Phone:
				tbl_entity_phone_serializer = tblEntityPhoneSerializer(p)		
				e = tbl_entity_phone_serializer.data 
				ePhone.append(e)	
			res_data['Phone'] = ePhone

		rtbl_Entity_Email = rtblEntityEmail.objects.filter(EntityIDF=tbl_entity)
		if rtbl_Entity_Email:	
			rEmail = []
			for e in rtbl_Entity_Email:
				rtbl_Entity_Email_Serializer = rtblEntityEmailSerializer(e)
				f = rtbl_Entity_Email_Serializer.data
				rEmail.append(f)

			res_data['Email'] = rEmail	

		tbl_Entity_SocialMedia = tblEntitySocialMedia.objects.filter(EntityIDF=tbl_entity)
		if tbl_Entity_SocialMedia:	
			eSocial = []
			for s in tbl_Entity_SocialMedia:
				tbl_Entity_SocialMedia_Serializer = tblEntitySocialMediaSerializer(s)
				g = tbl_Entity_SocialMedia_Serializer.data
				eSocial.append(g)

			res_data['SocialMedia'] = eSocial	
			
		
		return Response(res_data)

	def delete(self,request,pk,*args,**kwargs):
		tbl_entity = tblEntity.objects.get(EntityID=pk)
		# print(tbl_entity)
		tbl_entity.delete()	
		return Response({'msg':'Data Deleted'})

	def patch(self, request, pk, format=None):
		data = request.data
		# print(data)
				# for document
		if data['Document'] != 'undefined' and data['Document'] != '':
			# print(data['Document'])
			tbl_Document = tblDocument.objects.get(EntityIDF=pk)
			tbl_Document.Document = data['Document']
			tbl_Document.save()	
		try:
			PhotoType = data['PhotoType']
		except MultiValueDictKeyError:
			PhotoType = None
		try:
			AddressType = data['AddressType']
		except MultiValueDictKeyError:			
			AddressType = None
		try:
			SocialMediaType = data['SocialMediaType']
		except MultiValueDictKeyError:			
			SocialMediaType = None

		tbl_entity = tblEntity.objects.get(EntityID=pk)
		latest_entity = tblEntity.objects.last()
		# for tblentity 
		if data['FullName']:
			tbl_entity.FullName = data['FullName']
		if data['ShortName']:
			tbl_entity.ShortName = data['ShortName']
		if data['EntityType']:
			sbl_entity_type = stblEntityType.objects.get(EntityTypeID=data['EntityType'])
			tbl_entity.EntityTypeIDF = sbl_entity_type		
		tbl_entity.save()

		# # for tblPerson
		# print(tbl_entity.EntityTypeIDF)
		if tbl_entity.EntityTypeIDF.EntityTypeID == 1:

			tbl_Person = tblPerson.objects.get(EntityIDF=pk)
			if data['FirstName']:
				tbl_Person.FirstName = data['FirstName']
			if data['MiddleName']:
				tbl_Person.MiddleName = data['MiddleName']
			if data['LastName']:
				tbl_Person.LastName = data['LastName']
			if data['Gender']:
				tbl_Person.Gender = data['Gender']	
			if data['DOB']:
				tbl_Person.DOB = data['DOB']	
			if data['Experiance']:
				tbl_Person.Experiance = data['Experiance']
			if data['AboutPerson'] :
				tbl_Person.AboutPerson = data['AboutPerson']						
			if data['Status']:
				S = stblStatus.objects.get(Status=data['Status'])
				if tbl_Person.StatusIDF == S:
					pass
				else:
					tbl_Person.StatusIDF = S
					tblEntity_CallDetails = tblEntityCallDetails(AboutCall='Update Status',Date=(datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S"),CreatedBY=request.user,StatusIDF=S,EntityIDF=tbl_entity)
					tblEntity_CallDetails.save()
					tbl_Person.UpdatedBy = request.user
			if data['SuffixType']:
				Stype = stblSuffixType.objects.get(SuffixID=data['SuffixType'])
				tbl_Person.SuffixTypeIDF = Stype				
			if data['PersonType']:
				Ptype = stblPersonType.objects.get(PersonTypeID=data['PersonType'])
				tbl_Person.PersonTypeIDF = Ptype

			tbl_Person.save()

			if data['Skill'] :
				skills = tuple(map(str, data['Skill'].split(',')))
				tblEntity_Skills = tblEntitySkill.objects.filter(EntityIDF=pk)

				for tblEntity_Skill in tblEntity_Skills:
					if tblEntity_Skill.SkillIDF.Skill in skills:
						pass
					else:	
						tblEntity_Skill.delete()

				for s in skills:
				# print(s)
					Skills_ = stblSkill.objects.filter(Skill=s).first()
					if Skills_ :
						tblSkill = tblEntitySkill.objects.filter(EntityIDF=pk,SkillIDF=Skills_).first()
						if tblSkill:
							tblSkill.SkillIDF = Skills_
							tblSkill.save()
						else:
							tbl_Entity_Skill = tblEntitySkill(SkillIDF=Skills_,EntityIDF=tbl_entity).save()
								
					else:
						if s != '' and s != "other":
							sk = stblSkill(Skill=s).save()
							sk_letest = stblSkill.objects.last()
							tbl_Entity_Skill = tblEntitySkill(SkillIDF=sk_letest,EntityIDF=tbl_entity).save()


			rtbl_Entity = rtblEntity.objects.filter(PersonIDF = tbl_Person).first()
			if data['Designation']:
				rtbl_Entity.Designation = data['Designation']
				rtbl_Entity.save()					
			else:
				rtbl_Entity.Designation = None
				rtbl_Entity.save()						

		# # for tblCompany
		tbl_Company = tblCompany.objects.filter(EntityIDF=pk).first()
		rtbl_entity = rtblEntity.objects.filter(CompanyIDF = tbl_Company).first()
		# # print(rtbl_entity)

		if tbl_Company:
			if data['CompanyName']:
				tbl_Company.CompanyName = data['CompanyName']	
			if data['GSTINNo']:
				tbl_Company.GSTINNo = data['GSTINNo']	
			if data['Headquarter']:
				tbl_Company.Headquarter = data['Headquarter']	
			if data['WebsiteURL']:
				tbl_Company.WebsiteURL = data['WebsiteURL']	
			if data['About']:
				tbl_Company.About = data['About']	
			if data['Founded']:
				tbl_Company.Founded = data['Founded']	
			if data['Specialities']:
				tbl_Company.Specialities = data['Specialities']
			if data['AnnualRevenue']:
				tbl_Company.AnnualRevenue = data['AnnualRevenue']	
			# print(data['HeadCountID'])	
			tbl_Head_Count = tblHeadCount.objects.filter(HeadCountID=data['HeadCountID']).first()
			if data['HeadCountRange']:
				tbl_Head_Count.HeadCountRange = data['HeadCountRange']
			if data['HeadCountType']:
				HeadCountType = stblHeadCountType.objects.get(HeadCountTypeID=data['HeadCountType'])		
				tbl_Head_Count.HeadCountTypeIDF = HeadCountType
			tbl_Head_Count.save()				
			
			if data['CompanyType']:
				Company_Type = stblCompanyType.objects.get(CompanyTypeID=data['CompanyType'])
				tbl_Company.CompanyTypeIDF = Company_Type
			if data['IndustryType']:	
				Industry_Type = stblIndustryType.objects.get(IndustryID=data['IndustryType'])
				tbl_Company.IndustryIDF = Industry_Type
			tbl_Company.save()



		# # for SocialMedia
		if SocialMediaType != None:

			Sid = tuple(map(int, data['SocialmediaID'].split(',')))
			Stype = tuple(map(int, data['SocialMediaType'].split(',')))
			Surl = tuple(map(str, data['url'].split(',')))
			tblEntity_SocialMedia = tblEntitySocialMedia.objects.filter(EntityIDF=pk)
			for entity_SocialMedia in tblEntity_SocialMedia:
				if entity_SocialMedia.SocialMediaIDF.SocialmediaID in Sid:
					pass
				else:	
					entity_SocialMedia.delete()

			for sId,sType,sUrl in zip(Sid,Stype,Surl):
				if sId != 0:
					tbl_SocialMedia =  tblSocialMedia.objects.filter(SocialmediaID=sId).first()
					tbl_SocialMedia.url = sUrl
					sbl_social_type = stblSocialMediaType.objects.get(SocialMediaTypeID=sType)
					tbl_SocialMedia.SocialMediaTypeIDF = sbl_social_type
					tbl_SocialMedia.save()	
				else :
					sbl_social_type = stblSocialMediaType.objects.get(SocialMediaTypeID=sType)
					tbl_social = tblSocialMedia(url=sUrl,SocialMediaTypeIDF=sbl_social_type).save()
					latest_social = tblSocialMedia.objects.last()
					tbl_entity_social = tblEntitySocialMedia(EntityIDF=tbl_entity,SocialMediaIDF=latest_social).save()


		
		# for email
		eID = tuple(map(int, data['EmailID'].split(',')))
		eType = tuple(map(int, data['EmailType'].split(',')))
		eName = tuple(map(str, data['EmailAddress'].split(',')))
		
		rtbl_entity_email = rtblEntityEmail.objects.filter(EntityIDF=pk)
		for entity_email in rtbl_entity_email:
			if entity_email.EmailIDF.EmailID in eID:
				pass
			else:	
				entity_email.delete()
			
		for Eid,Etype,Ename in zip(eID,eType,eName):
			if Eid != 0: 	
				Email = tblEmail.objects.get(EmailID=Eid)
				Email.EmailAddress = Ename
				SEtype = stblEmailType.objects.get(EmailTypeID=Etype)
				Email.EmailTypeIDF = SEtype
				Email.save()		
			else:
				SEtype = stblEmailType.objects.get(EmailTypeID=Etype)
				Email = tblEmail(EmailAddress=Ename,EmailTypeIDF=SEtype).save()	
				latest_Email = tblEmail.objects.last()
				rtbl_entity_email = rtblEntityEmail(EmailIDF=latest_Email,EntityIDF=tbl_entity).save()	


		# for address
		if AddressType != None :	
			Aid = tuple(map(int, data['AddressID'].split(',')))
			AType = tuple(map(int, data['AddressType'].split(',')))
			Address = tuple(map(str, data['Address'].split(',')))
			City = tuple(map(str, data['City'].split(',')))
			District = tuple(map(str, data['District'].split(',')))
			State = tuple(map(str, data['State'].split(',')))
			Country = tuple(map(str, data['Country'].split(',')))
			PinCode = tuple(map(int, data['PinCode'].split(',')))
			
			rtbl_entity_address = rtblEntityAddress.objects.filter(EntityIDF=pk)
			for entity_address in rtbl_entity_address:
				if entity_address.AddressIDF.AddressID in Aid:
					pass
				else:
					entity_address.delete()
			 		# print('deleted')

			for aid,at,add,ct,dt,st,cn,pc in zip(Aid,AType,Address,City,District,State,Country,PinCode) :

				if aid != 0:
					tbl_Address = tblAddress.objects.get(AddressID = aid)
					tbl_Address.Address = add
					tbl_Address.City = ct
					tbl_Address.District = dt
					tbl_Address.State = st
					tbl_Address.PinCode = pc
					tbl_Address.Country = cn
					Atype = stblAddressType.objects.get(AddressTypeID=at)
					tbl_Address.AddressTypeIDF = Atype
					tbl_Address.save()
				else :
					Atype = stblAddressType.objects.get(AddressTypeID=at)
					Address = tblAddress(Address=add,City=ct,District=dt,State=st,Country=ct,PinCode=pc,AddressTypeIDF=Atype).save()
					latest_Address = tblAddress.objects.last()
					rtbl_entity_address = rtblEntityAddress(AddressIDF = latest_Address,EntityIDF=tbl_entity).save() 

					
		
		# # for Photo
		if PhotoType != None:
			tbl_Photo = tblPhoto.objects.filter(EntityIDF=pk).first()
			if tbl_Photo:
				if data['Photo'] == 'undefined':
					pass
				else:	
					tbl_Photo.Photo = data['Photo']
				if data['PhotoType']:	
					stbl_Photo_Type = stblPhotoType.objects.get(PhotoTypeID=data['PhotoType'])
					tbl_Photo.PhotoTypeIDF = stbl_Photo_Type

					tbl_Photo.save()
			else:

				stbl_Photo_Type = stblPhotoType.objects.get(PhotoTypeID=data['PhotoType'])
				tbl_Photo = tblPhoto(Photo = data['Photo'],PhotoTypeIDF=stbl_Photo_Type,EntityIDF=tbl_entity).save() 
			
	

		# for Phone number
		# print(data['PhoneID'])
		pID = tuple(map(int,data['PhoneID'].split(',')))
		No =  tuple(map(str, data['PhoneNo'].split(',')))
		Type = tuple(map(int, data['PhoneType'].split(',')))
		Code = tuple(map(int, data['CountryCode'].split(',')))
		
		# print(pID)
		# print(No)
		# print(Type)
		# print(Code)

		tbl_entity_phone = tblEntityPhone.objects.filter(EntityIDF=pk)
		for entity_phone in tbl_entity_phone:
			if entity_phone.PhoneIDF.PhoneID in pID:
				# print(entity_phone.PhoneIDF.PhoneID)
				pass
			else:
				entity_phone.delete()
				# print('deleted')
		for (Pid,Pno,PType,PCode) in zip(pID,No,Type,Code): 

			if Pid != 0:
				# print(PCode)
				tbl_Phone = tblPhone.objects.get(PhoneID=Pid)
				# print(tbl_Phone.PhoneID)
				tbl_Phone.PhoneNo = Pno
				Ccode = tblCountryCode.objects.get(CountryCode='+' + str(PCode))
				tbl_Phone.CodeIDF = Ccode
				Ptype = stblPhoneType.objects.get(PhoneTypeID=PType)
				tbl_Phone.PhoneTypeIDF = Ptype 
				tbl_Phone.save() 			
			else:
				Ccode = tblCountryCode.objects.get(CountryCode='+' + str(PCode))
				Ptype = stblPhoneType.objects.get(PhoneTypeID=PType)
				Pnumber = tblPhone(CodeIDF=Ccode,PhoneNo=Pno,PhoneTypeIDF=Ptype).save()
				latest_Pnumber = tblPhone.objects.last()
				tbl_entity_phone = tblEntityPhone(EntityIDF=tbl_entity,PhoneIDF=latest_Pnumber).save()
				# print('create')
			


		return Response({'msg':'Data Updated'})		


class EntitySearchApi(generics.ListAPIView):
	serializer_class = tblEntitySerializer
	filter_backends = [SearchFilter]
	search_fields = ['FullName', 'ShortName']
	# filter_backends = (DjangoFilterBackend,)
	# filter_fields = ('FullName', 'ShortName')
		

	def get_queryset(self):
		search = self.request.query_params.get('search')
		# print(search)
		queryset = None
		if search == "":
			# print("null")
			queryset = tblEntity.objects.all()
		else : 
			queryset = tblEntity.objects.filter(Q(FullName__icontains=search)|Q(ShortName__icontains=search))

		final_phone_queryset = []
		final_email_queryset = []	
		final_photo_queryset = []	
		final_person_queryset = []	

		
		#get entity id from queryset
		#call get in rtblphonenumber table by entity field for get phonenumber
		for q in queryset:
			# print(q)
			entity_phone_obj = tblEntityPhone.objects.filter(EntityIDF=q).first()
			# print(entity_phone_obj)
			#call get in rtblemail table by entity field for get emailid	
			entity_email_obj = rtblEntityEmail.objects.filter(EntityIDF=q).first()
			tbl_Photo = tblPhoto.objects.filter(EntityIDF=q).first()
			tbl_Person = tblPerson.objects.filter(EntityIDF=q).first()
			
			final_phone_queryset.append(entity_phone_obj)
			final_email_queryset.append(entity_email_obj)
			final_photo_queryset.append(tbl_Photo)
			final_person_queryset.append(tbl_Person)

		if queryset is None:
			queryset = None
			final_phone_queryset = None
			final_email_queryset = None
			final_photo_queryset = None
			final_person_queryset = None

		return queryset, final_phone_queryset, final_email_queryset,final_photo_queryset,final_person_queryset

	def get(self,request):
		entity_dict = {}
		queryset, final_phone_queryset,final_email_queryset,final_photo_queryset,final_person_queryset = self.get_queryset()
		data = []
		if queryset:
			for i in range(len(queryset)):

				tbl_entity_serializer = tblEntitySerializer(queryset[i])
				entity_dict = tbl_entity_serializer.data

				# for final_phone_qs in final_phone_queryset:
				entity_dict.update({
				'Phone' : tblEntityPhoneSerializer(final_phone_queryset[i]).data,
				'Email' : rtblEntityEmailSerializer(final_email_queryset[i]).data,
				'Photo' : tblPhotoSerializer(final_photo_queryset[i],context={"request": request}).data,
				'Person' : tblPersonSerializer(final_person_queryset[i]).data 
				})
					
				data.append(entity_dict)
						
		return Response(data)


class EntityDetailApi(APIView):
	latest_person = None
	latest_Company = None

	def get(self, request, format=None):
		res_data = []
		tbl_entity = tblEntity.objects.all()


		for Entity in tbl_entity:
		
			tbl_entity_serializer = tblEntitySerializer(Entity)

			tbl_Entity_Phone =tblEntityPhone.objects.filter(EntityIDF=Entity.EntityID).first()
			tbl_entity_phone_serializer = tblEntityPhoneSerializer(tbl_Entity_Phone)	

			
			rtbl_Entity_Email = rtblEntityEmail.objects.filter(EntityIDF= Entity.EntityID).first()
			rtbl_Entity_Email_Serializer = rtblEntityEmailSerializer(rtbl_Entity_Email)

			tbl_Photo = tblPhoto.objects.filter(EntityIDF=Entity.EntityID).first()
			tbl_Photo_Serializer = tblPhotoSerializer(tbl_Photo,context={"request": request})	
			
			# print(Entity.EntityID)
			tbl_Person = tblPerson.objects.filter(EntityIDF=Entity.EntityID).first()
			tbl_Person_serializer = tblPersonSerializer(tbl_Person)				
			i = tbl_Person_serializer.data

			h = tbl_Photo_Serializer.data

			a = tbl_entity_serializer.data
			b =	tbl_entity_phone_serializer.data
			c = rtbl_Entity_Email_Serializer.data


			z = {**a,**b,**c,**h,**i}
			# print(z)
			res_data.append(z)
		return Response(res_data)
	
	def post(self,request,format=None):
		data = request.data
		# print(data)
		try:
			PhotoType = data['PhotoType']
		except MultiValueDictKeyError:
			PhotoType = None
		try:
			AddressType = data['AddressType']
		except MultiValueDictKeyError:			
			AddressType = None
		try:
			SocialMediaType = data['SocialMediaType']
		except MultiValueDictKeyError:			
			SocialMediaType = None

		# for entity
		sbl_entity_type = stblEntityType.objects.get(EntityTypeID=data['EntityType'])
		tbl_entity = tblEntity(FullName=data['FullName'],ShortName=data['ShortName'],EntityTypeIDF=sbl_entity_type,CreatedBY=request.user).save()
		latest_entity = tblEntity.objects.last()

		# for document
		if data['Document'] != 'undefined' or data['Document'] != '':
			tbl_Document = tblDocument(EntityIDF=latest_entity,Document=data['Document'])
			tbl_Document.save()

		# # for Phone
		No =  tuple(map(str, data['PhoneNo'].split(',')))
		Type = tuple(map(int, data['PhoneType'].split(',')))
		Code = tuple(map(int, data['CountryCode'].split(',')))
		for (No,Type,Code) in zip(No,Type,Code):
			Ccode = tblCountryCode.objects.get(CountryCode='+' + str(Code))
			Ptype = stblPhoneType.objects.get(PhoneTypeID=Type)
			Pnumber = tblPhone(CodeIDF=Ccode,PhoneNo=No,PhoneTypeIDF=Ptype).save()
			latest_Pnumber = tblPhone.objects.last()
			tbl_entity_phone = tblEntityPhone(EntityIDF=latest_entity,PhoneIDF=latest_Pnumber).save()


		# # # for Email		
		eType = tuple(map(int, data['EmailType'].split(',')))
		eName = tuple(map(str, data['EmailAddress'].split(',')))

		for ET,EN in zip(eType,eName):
			Etype = stblEmailType.objects.get(EmailTypeID=ET)
			Email = tblEmail(EmailAddress=EN,EmailTypeIDF=Etype).save()	
			latest_Email = tblEmail.objects.last()
			rtbl_entity_email = rtblEntityEmail(EmailIDF=latest_Email,EntityIDF=latest_entity).save()
		

		if PhotoType != None:
			# print(data['PhotoType'])
			stbl_Photo_Type = stblPhotoType.objects.get(PhotoTypeID=data['PhotoType'])
			
			tbl_Photo = tblPhoto(Photo = data['Photo'],PhotoTypeIDF=stbl_Photo_Type,EntityIDF=latest_entity).save() 
			
		# # # for person
		if data['FirstName']:
			Stype = stblSuffixType.objects.get(SuffixID=data['SuffixType'])
			PersonType = stblPersonType.objects.get(PersonTypeID=data['PersonType'])
			status_ = stblStatus.objects.get(Status=data['Status'])

			tblperson = tblPerson(FirstName = data["FirstName"],MiddleName=data["MiddleName"],LastName = data["LastName"],Gender=data["Gender"],DOB=data["DOB"],SuffixIDF=Stype,PersonTypeIDF= PersonType,Experiance=data['Experiance'],StatusIDF=status_,EntityIDF=latest_entity)
			if data['AboutPerson'] :
				tblperson.AboutPerson = data['AboutPerson']
			tblperson.save()
			global latest_person 
			latest_person = tblPerson.objects.last()
		
		if data['Skill'] :
			skills = tuple(map(str, data['Skill'].split(',')))
			for s in skills:
				# print(s)
				Skills_ = stblSkill.objects.filter(Skill=s).first()
				if Skills_ :
					tbl_Entity_Skill = tblEntitySkill(SkillIDF=Skills_,EntityIDF=latest_entity).save()
				else:
					if s != '' and s != "other":
						sk = stblSkill(Skill=s).save()
						sk_letest = stblSkill.objects.last()
						tbl_Entity_Skill = tblEntitySkill(SkillIDF=sk_letest,EntityIDF=latest_entity).save()


		if data['CompanyName']:
			# Head Count Type
			HeadCountType = stblHeadCountType.objects.get(HeadCountTypeID=data['HeadCountType'])		
			HeadCount = tblHeadCount(HeadCountRange=data['HeadCountRange'],HeadCountTypeIDF=HeadCountType)
			HeadCount.save()
			latest_HeadCount = tblHeadCount.objects.last()
			# print(latest_HeadCount)
			CompanyType = stblCompanyType.objects.get(CompanyTypeID=data['CompanyType'])
			IndustryType = stblIndustryType.objects.get(IndustryID=data['IndustryType'])
			tblcompany = tblCompany(CompanyName=data['CompanyName'],GSTINNo=data['GSTINNo'],Headquarter=data['Headquarter'],WebsiteURL=data['WebsiteURL'],About=data['About'],Founded=data['Founded'],Specialities=data['Specialities'],AnnualRevenue=data['AnnualRevenue'],HeadcountIDF=latest_HeadCount,CompanyTypeIDF=CompanyType,IndustryIDF=IndustryType,EntityIDF=latest_entity)
			tblcompany.save()
			global latest_Company 
			latest_Company = tblCompany.objects.last()

		# # # for Address
		if AddressType != None :

			AType = tuple(map(int, data['AddressType'].split(',')))
			Address = tuple(map(str, data['Address'].split(',')))
			City = tuple(map(str, data['City'].split(',')))
			District = tuple(map(str, data['District'].split(',')))
			State = tuple(map(str, data['State'].split(',')))
			Country = tuple(map(str, data['Country'].split(',')))
			PinCode = tuple(map(int, data['PinCode'].split(',')))
			for at,add,ct,dt,st,cn,pc in zip(AType,Address,City,District,State,Country,PinCode) :	
				Atype = stblAddressType.objects.get(AddressTypeID=at)
				Address = tblAddress(Address=add,City=ct,District=dt,State=st,Country=cn,PinCode=pc,AddressTypeIDF=Atype).save()
				latest_Address = tblAddress.objects.last()
				rtbl_entity_address = rtblEntityAddress(AddressIDF = latest_Address,EntityIDF=latest_entity).save() 

		# # # for rtbl entity
		rtbl_entity = rtblEntity(EntityTypeIDF=sbl_entity_type)
		if AddressType != None:
			rtbl_entity.AddressIDF=latest_Address
		if data['FirstName']:	
			rtbl_entity.PersonIDF=latest_person
		if data['CompanyName']:	
			rtbl_entity.CompanyIDF=latest_Company
		if data['Designation']:	
			rtbl_entity.Designation=data['Designation']	
			
		rtbl_entity.save()

					
		# # for social media
		if SocialMediaType != None:
			Smedia = tuple(map(int, data['SocialMediaType'].split(',')))
			Surl = tuple(map(str, data['url'].split(',')))
			for sMedia,sUrl in zip(Smedia,Surl):
				sbl_social_type = stblSocialMediaType.objects.get(SocialMediaTypeID=sMedia)
				tbl_social = tblSocialMedia(url=sUrl,SocialMediaTypeIDF=sbl_social_type).save()
				latest_social = tblSocialMedia.objects.last()
				tbl_entity_social = tblEntitySocialMedia(EntityIDF=latest_entity,SocialMediaIDF=latest_social).save()




		return Response({'msg':'Data Created'},status=status.HTTP_201_CREATED)


	def delete(self,request,format=None):
		data = request.data
		# print(data)
		for entity in data:
			tbl_entity = tblEntity.objects.get(EntityID=entity)
			# print(tbl_entity)
			tbl_entity.delete()


		return Response({'msg':'Data Deleted'})

# for All static table 
class StaticDataApi(ObjectMultipleModelAPIView):
	 querylist =[
		{'queryset':stblPhoneType.objects.all(),'serializer_class':stblPhoneTypeSerializer, 'label': 'Phone_Type'},
		{'queryset':tblCountryCode.objects.all(),'serializer_class':tblCountryCodeSerializer, 'label': 'Country_Code'},
		{'queryset':stblEntityType.objects.all(),'serializer_class':stblEntityTypeSerializer, 'label': 'Entity_Type'},
		
		{'queryset':stblAddressType.objects.all(),'serializer_class':stblAddressTypeSerializer, 'label': 'Address_Type'},
		{'queryset':stblHeadCountType.objects.all(),'serializer_class':stblHeadCountTypeSerializer, 'label': 'HeadCount_Type'},
		{'queryset':stblEmailType.objects.all(),'serializer_class':stblEmailTypeSerializer, 'label': 'Email_Type'},
		
		{'queryset':stblPhotoType.objects.all(),'serializer_class':stblPhotoTypeSerializer, 'label': 'Photo_Type'},
		{'queryset':stblSocialMediaType.objects.all(),'serializer_class':stblSocialMediaTypeSerializer, 'label': 'SocialMedia_Type'},
		{'queryset':stblCompanyType.objects.all(),'serializer_class':stblCompanyTypeSerializer, 'label': 'Company_Type'},
		
		{'queryset':stblIndustryType.objects.all(),'serializer_class':stblIndustryTypeSerializer, 'label': 'Industry_Type'},
		{'queryset':stblSuffixType.objects.all(),'serializer_class':stblSuffixTypeSerializer, 'label': 'Suffix_Type'},
		{'queryset':stblPersonType.objects.all(),'serializer_class':stblPersonTypeSerializer, 'label': 'Person_Type'},
	 
		{'queryset':stblStatus.objects.all(),'serializer_class':stblStatusSerializer, 'label': 'Status'},
		{'queryset':stblSkill.objects.all(),'serializer_class':stblSkillSerializer, 'label': 'Skill'},

	 ]
	 


class UserViewSet(viewsets.ModelViewSet):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	
	def get_queryset(self):
		# print(self.request.user)
		user = User.objects.filter(username=self.request.user) 
		return user

class stblCountryCodeTypeViewSet(viewsets.ModelViewSet):
	queryset = stblCountryCodeType.objects.all()
	serializer_class = stblCountryCodeTypeSerializer
	# permission_classes = [IsAuthenticated]
	# filter_backends = [SearchFilter]

class stblPhoneTypeViewSet(viewsets.ModelViewSet):
	queryset = stblPhoneType.objects.all()
	serializer_class = stblPhoneTypeSerializer	


class tblCountryCodeViewSet(viewsets.ModelViewSet):
	queryset = tblCountryCode.objects.all()
	serializer_class = tblCountryCodeSerializer		


class tblPhoneViewSet(viewsets.ModelViewSet):
	queryset = tblPhone.objects.all()
	serializer_class = tblPhoneSerializer	
	search_fields = ['PhoneNo']


class stblEntityTypeViewSet(viewsets.ModelViewSet):
	queryset = stblEntityType.objects.all()
	serializer_class = stblEntityTypeSerializer	

class tblEntityViewSet(viewsets.ModelViewSet):
	queryset = tblEntity.objects.all()
	serializer_class = tblEntitySerializer
	filter_backends = [SearchFilter]
	search_fields = ['FullName','ShortName']					


class stblAddressTypeViewSet(viewsets.ModelViewSet):
	queryset = stblAddressType.objects.all()
	serializer_class = stblAddressTypeSerializer	

class tblAddressViewSet(viewsets.ModelViewSet):
	queryset = tblAddress.objects.all()
	serializer_class = tblAddressSerializer					
	filter_backends = [SearchFilter]
	search_fields = ['City','District','State','PinCode','Country']
	

	
class stblHeadCountTypeViewSet(viewsets.ModelViewSet):
	queryset = stblHeadCountType.objects.all()
	serializer_class = stblHeadCountTypeSerializer	

class tblHeadCountViewSet(viewsets.ModelViewSet):
	queryset = tblHeadCount.objects.all()
	serializer_class = tblHeadCountSerializer					



class stblEmailTypeViewSet(viewsets.ModelViewSet):
	queryset = stblEmailType.objects.all()
	serializer_class = stblEmailTypeSerializer	

class tblEmailViewSet(viewsets.ModelViewSet):
	queryset = tblEmail.objects.all()
	serializer_class = tblEmailSerializer					



class stblPhotoTypeViewSet(viewsets.ModelViewSet):
	queryset = stblPhotoType.objects.all()
	serializer_class = stblPhotoTypeSerializer	

class tblPhotoViewSet(viewsets.ModelViewSet):
	queryset = tblPhoto.objects.all()
	serializer_class = tblPhotoSerializer					



class stblSocialMediaTypeViewSet(viewsets.ModelViewSet):
	queryset = stblSocialMediaType.objects.all()
	serializer_class = stblSocialMediaTypeSerializer	

class tblSocialMediaViewSet(viewsets.ModelViewSet):
	queryset = tblSocialMedia.objects.all()
	serializer_class = tblSocialMediaSerializer					


class stblCompanyTypeViewSet(viewsets.ModelViewSet):
	queryset = stblCompanyType.objects.all()
	serializer_class = stblCompanyTypeSerializer	

class stblIndustryTypeViewSet(viewsets.ModelViewSet):
	queryset = stblIndustryType.objects.all()
	serializer_class = stblIndustryTypeSerializer					

class stblSuffixTypeViewSet(viewsets.ModelViewSet):
	queryset = stblSuffixType.objects.all()
	serializer_class = stblSuffixTypeSerializer					


class tblEntitySocialMediaViewSet(viewsets.ModelViewSet):
	queryset = tblEntitySocialMedia.objects.all()
	serializer_class = tblEntitySocialMediaSerializer	

# class tblDocumentViewSet(viewsets.ModelViewSet):
# 	queryset = tblDocument.objects.all()
# 	serializer_class = tblDocumentSerializer					

class stblStatusViewSet(viewsets.ModelViewSet):
	queryset = stblStatus.objects.all()
	serializer_class = stblStatusSerializer



class stblSkillViewSet(viewsets.ModelViewSet):
	queryset = stblSkill.objects.all()
	serializer_class = stblSkillSerializer

class tblEntitySkillViewSet(viewsets.ModelViewSet):
	queryset = tblEntitySkill.objects.all()
	serializer_class = tblEntitySkillSerializer	

class stblPersonTypeViewSet(viewsets.ModelViewSet):
	queryset = stblPersonType.objects.all()
	serializer_class = stblPersonTypeSerializer		

class tblPersonViewSet(viewsets.ModelViewSet):
	queryset = tblPerson.objects.all()
	serializer_class = tblPersonSerializer
	filter_backends = [SearchFilter]
	search_fields = ['FirstName','MiddleName','LastName']

class tblCompanyViewSet(viewsets.ModelViewSet):
	queryset = tblCompany.objects.all()
	serializer_class = tblCompanySerializer
	filter_backends = [SearchFilter]
	search_fields = ['CompanyName']



class tblEntityPhoneViewSet(viewsets.ModelViewSet):
	queryset = tblEntityPhone.objects.all()
	serializer_class = tblEntityPhoneSerializer

class rtblEntityEmailViewSet(viewsets.ModelViewSet):
	queryset = rtblEntityEmail.objects.all()
	serializer_class = rtblEntityEmailSerializer

class rtblEntityViewSet(viewsets.ModelViewSet):
	queryset = rtblEntity.objects.all()
	serializer_class = rtblEntitySerializer			
	filter_backends = [SearchFilter]
	search_fields = ['Designation']
