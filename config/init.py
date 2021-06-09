<<<<<<< HEAD
import json
from tesla_ce import models
from tesla_ce.client import Client
from tesla_ce.client import ConfigManager

# reconfigure
client = Client(config_file=ConfigManager.find_config_file(), use_vault=False, use_env=False, enable_management=True)
client.initialize()

# register_vle
type = 'moodle'
name = 'test_vle'
url = 'moodle.tesla-ce'
client_id = '1234'
institution_acronym = 'test'
force_update = True

# Register the new VLE
vle_info = client.register_vle(type, name, url, institution_acronym, client_id, force_update)

with open('/etc/tesla/env_moodle_template') as moodle_file:
    moodle_content = moodle_file.read()
    moodle_content = moodle_content.replace("##ROLE_ID##", vle_info['role_id'])
    moodle_content = moodle_content.replace("##SECRET_ID##", vle_info['secret_id'])

with open('/etc/tesla/.env_moodle', 'w') as moodle_file:
    moodle_file.write(moodle_content)

# register provider
provider_file = '/etc/tesla/fr_tfr.json'
with open(provider_file, 'r') as fd_provider:
    provider_desc = json.load(fd_provider)
    provider_info = client.register_provider(provider_desc, force_update=True)

with open('/etc/tesla/env_tfr_template', 'r') as tfr_file:
    tfr_content = tfr_file.read()
    tfr_content = tfr_content.replace("##ROLE_ID##", provider_info['role_id'])
    tfr_content = tfr_content.replace("##SECRET_ID##", provider_info['secret_id'])

with open('/etc/tesla/.env_tfr', 'w') as tfr_file:
    tfr_file.write(tfr_content)

# Configure DB parameters
=======
from tesla_ce import models

>>>>>>> 6f9ed59f1c0f2a443b030bb996fba0fe63cf3714
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
<<<<<<< HEAD


=======
>>>>>>> 6f9ed59f1c0f2a443b030bb996fba0fe63cf3714
