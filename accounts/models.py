from django.db import models, IntegrityError
from django.shortcuts import redirect
from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.http import HttpResponseRedirect
import logging

logger = logging.getLogger(__name__)
# Create your models here.
class UserModel(AbstractUser):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    username = models.CharField(max_length=255, unique=True)
    email = models.EmailField(null=False)
    password = models.CharField(max_length=500)

    def save(self, *arg, **kwarg):
        try:
            super().save(*arg, **kwarg)
        except IntegrityError: 
            logger.error("IntegrityError during save: %s", self.email)
            return HttpResponseRedirect(reverse('register'))
        except Exception as e:
            logger.error("Error during save: %s", e)
            raise  # Re-raise the exception after logging

    def __str__(self) -> str:
        return self.email
