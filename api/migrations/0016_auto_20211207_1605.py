# Generated by Django 3.2.7 on 2021-12-07 10:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0015_auto_20211202_1107'),
    ]

    operations = [
        migrations.AlterField(
            model_name='stblsuffixtype',
            name='SuffixType',
            field=models.CharField(max_length=10),
        ),
        migrations.AlterField(
            model_name='tblcompany',
            name='HeadcountIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblheadcount'),
        ),
    ]
