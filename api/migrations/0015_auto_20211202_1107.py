# Generated by Django 3.2.7 on 2021-12-02 05:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0014_auto_20210924_1532'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='stblcountrycodetype',
            options={'verbose_name_plural': 'stbl Country Code Type'},
        ),
        migrations.AlterModelOptions(
            name='stblphonetype',
            options={'verbose_name_plural': 'stbl Phone Type'},
        ),
        migrations.AddField(
            model_name='tblperson',
            name='AddressIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tbladdress'),
        ),
        migrations.AddField(
            model_name='tblperson',
            name='EmailIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblemail'),
        ),
        migrations.AddField(
            model_name='tblperson',
            name='PhoneIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblphone'),
        ),
    ]
