if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

from mage_ai.io.file import FileIO

@data_loader
def load_data_from_dataset(*args, **kwargs):
    """
    This data loader will load data from dataset folder 
    and then read the data
    """

    loader = FileIO(verbose=True)
    suicide_rates_df = loader.load('./dataset/suicide_rates_1990-2022.csv')

    # map data types
    suicide_rates_dtypes = {
        'RegionCode': str,
        'RegionName': str,
        'CountryCode': str,
        'CountryName': str,
        'Year': int,
        'Sex': str,
        'AgeGroup': str,
        'Generation': str,
        'SuicideCount': float,
        'CauseSpecificDeathPercentage': float,
        'DeathRatePer100K': float,
        'Population': float,
        'GDP': float,
        'GDPPerCapita': float,
        'GrossNationalIncome': float,
        'GNIPerCapita': float,
        'InflationRate': float,
        'EmploymentPopulationRatio': float
    }

    suicide_rates_df = suicide_rates_df.astype(suicide_rates_dtypes)

    print("Processing the dataset completed.")

    return suicide_rates_df


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
