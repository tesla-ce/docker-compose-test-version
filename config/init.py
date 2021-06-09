from tesla_ce import models

institution = models.Institution.objects.get(id=1)
institution.external_ic = True
institution.save()

instrument = models.Instrument.objects.get(id=1)
instrument.enabled = True
instrument.save()

prov = models.Provider.objects.get(id=1)
prov.validation_active = True
prov.enabled = True
prov.save()
