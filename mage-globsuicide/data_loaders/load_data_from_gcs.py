from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.google_cloud_storage import GoogleCloudStorage

import os

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_from_google_cloud_storage(*args, **kwargs):
    """
    This Block loads the Parquet file from GCS.
    """
    print("Loading the Parquet file from GCS Bucket ...")

    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = os.environ.get('GCP_CREDENTIALS')
    os.environ['GOOGLE_CLOUD_PROJECT'] = os.environ.get('GCP_PROJECT_ID')

    config_path = os.path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'

    bucket_name = os.environ.get('GCS_BUCKET')
    folder_name = 'globsuicide_data'

    file_name_csv = "suicide_rates_1990-2022.csv"
    file_name_parquet = file_name_csv.replace(".csv", ".parquet")
    object_key = f'{folder_name}/{file_name_parquet}'

    print(object_key)

    return GoogleCloudStorage.with_config(ConfigFileLoader(config_path, config_profile)).load(
        bucket_name,
        object_key,
    )

@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
