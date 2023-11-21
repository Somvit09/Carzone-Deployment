# Generated by Django 4.0 on 2023-11-21 12:26

from django.db import migrations
import multiselectfield.db.fields


class Migration(migrations.Migration):

    dependencies = [
        ('cars', '0006_alter_car_year'),
    ]

    operations = [
        migrations.AlterField(
            model_name='car',
            name='condition',
            field=multiselectfield.db.fields.MultiSelectField(choices=[('Excellent', 'Excellent'), ('Out standing', 'Out standing'), ('New', 'New'), ('Used', 'Used')], max_length=50),
        ),
    ]
