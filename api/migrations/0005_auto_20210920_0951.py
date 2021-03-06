# Generated by Django 3.2.7 on 2021-09-20 04:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_stblheadcounttype_tblheadcount'),
    ]

    operations = [
        migrations.CreateModel(
            name='stblEmailType',
            fields=[
                ('EmailTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('EmailType', models.CharField(max_length=15)),
            ],
        ),
        migrations.AlterField(
            model_name='stbladdresstype',
            name='AddressType',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='stblcountrycodetype',
            name='CountryName',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='stblentitytype',
            name='EntityType',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='stblphonetype',
            name='PhoneType',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='tbladdress',
            name='Address',
            field=models.TextField(),
        ),
        migrations.CreateModel(
            name='tblEmail',
            fields=[
                ('EmailID', models.AutoField(primary_key=True, serialize=False)),
                ('EmailAddress', models.EmailField(max_length=50)),
                ('EmailTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblemailtype')),
            ],
        ),
    ]
