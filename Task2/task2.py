import pandas as pd

# Load the CSV files into Pandas DataFrames
userprofile_df = pd.read_csv('Task2/task2_userprofile.csv')
trading_volume_df = pd.read_csv('Task2/task2_trading_volume.csv')
entities_mapping_df = pd.read_csv('Task2/task2_entities_mapping.csv')

# Display the first few rows and basic info of each dataset to understand their structure
userprofile_info = userprofile_df.info(), userprofile_df.head()
trading_volume_info = trading_volume_df.info(), trading_volume_df.head()
entities_mapping_info = entities_mapping_df.info(), entities_mapping_df.head()

userprofile_info, trading_volume_info, entities_mapping_info
