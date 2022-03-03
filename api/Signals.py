from django.db.models.signals import post_delete
from django.dispatch import receiver
from .models import tblEntityPhone,tblPhone,rtblEntityEmail,tblEmail,rtblEntityAddress,tblAddress,tblEntitySocialMedia,tblSocialMedia

@receiver(post_delete, sender=tblEntityPhone)
def delete_phone(sender, instance, **kwargs):
    tblPhone.objects.filter(PhoneID=instance.PhoneIDF.PhoneID).delete()


@receiver(post_delete,sender=rtblEntityEmail) 
def delete_email(sender,instance,**kwargs):
	tblEmail.objects.filter(EmailID=instance.EmailIDF.EmailID).delete()


@receiver(post_delete,sender=rtblEntityAddress)
def delete_address(sender,instance,**kwargs):
	tblAddress.objects.filter(AddressID=instance.AddressIDF.AddressID).delete()


@receiver(post_delete,sender=tblEntitySocialMedia)
def delete_social(sender,instance,**kwargs):
	tblSocialMedia.objects.filter(SocialmediaID=instance.SocialMediaIDF.SocialmediaID).delete()
