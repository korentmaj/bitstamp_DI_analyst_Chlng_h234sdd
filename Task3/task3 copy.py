import pandas as pd

bitstamp_data = pd.read_csv('Task3/task3_bitstamp_data.csv')

bitstamp_data_info = bitstamp_data.info(), bitstamp_data.head()
bitstamp_data_info


bitstamp_data['date'] = pd.to_datetime(bitstamp_data['date'], format='%d/%m/%Y')


bitstamp_data['market_share'] = bitstamp_data['trading volume'] / bitstamp_data['total_market_volume']


bitstamp_data = bitstamp_data.sort_values('date')

# 7-day moving averages
bitstamp_data['7_day_avg_trading_volume'] = bitstamp_data.groupby('client_type')['trading volume'].transform(lambda x: x.rolling(7, 1).mean())
bitstamp_data['7_day_avg_new_clients'] = bitstamp_data.groupby('client_type')['new_registered_clients'].transform(lambda x: x.rolling(7, 1).mean())
bitstamp_data['7_day_avg_trading_revenue'] = bitstamp_data.groupby('client_type')['trading_revenue'].transform(lambda x: x.rolling(7, 1).mean())
bitstamp_data['7_day_avg_active_clients'] = bitstamp_data.groupby('client_type')['daily_active_clients'].transform(lambda x: x.rolling(7, 1).mean())


latest_date = bitstamp_data['date'].max()
report_data = bitstamp_data[bitstamp_data['date'] == latest_date]


report_data



import matplotlib.pyplot as plt


def generate_bitstamp_report(date_str):
    
    report_date = pd.to_datetime(date_str, format='%d/%m/%Y')
    
    report_data = bitstamp_data[bitstamp_data['date'] == report_date]
    
    if report_data.empty:
        print(f"No data available for {date_str}. Please choose another date.")
        return
    
    fig, axs = plt.subplots(3, 2, figsize=(14, 18))
    fig.suptitle(f'Bitstamp Daily Performance Report - {report_date.strftime("%d %B %Y")}', fontsize=16)
    
    axs[0, 0].axis('off')
    axs[0, 0].text(0.5, 0.7, 'Corporate Trading Volume', ha='center', fontsize=12)
    axs[0, 0].text(0.5, 0.6, f"${report_data.iloc[0]['trading volume']:,}", ha='center', fontsize=24, color='green')
    axs[0, 0].text(0.5, 0.4, 'Retail Trading Volume', ha='center', fontsize=12)
    axs[0, 0].text(0.5, 0.3, f"${report_data.iloc[1]['trading volume']:,}", ha='center', fontsize=24, color='green')
    
    axs[0, 1].axis('off')
    axs[0, 1].text(0.5, 0.7, 'Corporate Active Clients', ha='center', fontsize=12)
    axs[0, 1].text(0.5, 0.6, f"{report_data.iloc[0]['daily_active_clients']:,}", ha='center', fontsize=24, color='blue')
    axs[0, 1].text(0.5, 0.4, 'Retail Active Clients', ha='center', fontsize=12)
    axs[0, 1].text(0.5, 0.3, f"{report_data.iloc[1]['daily_active_clients']:,}", ha='center', fontsize=24, color='blue')
    
    axs[1, 0].bar(['BTC Price', 'BTC Dominance'], 
                  [report_data.iloc[0]['btc_price'], report_data.iloc[0]['btc_dominance'] * 100], 
                  color=['orange', 'purple'])
    axs[1, 0].set_title('Market Indicators')
    
    axs[1, 1].bar(['Corporate Market Share', 'Retail Market Share'], 
                  [report_data.iloc[0]['market_share'] * 100, report_data.iloc[1]['market_share'] * 100], 
                  color=['teal', 'coral'])
    axs[1, 1].set_title('Market Share (%)')
    
    axs[2, 0].plot(bitstamp_data[bitstamp_data['client_type'] == 'corporate']['date'], 
                   bitstamp_data[bitstamp_data['client_type'] == 'corporate']['7_day_avg_trading_volume'], 
                   label='Corporate', color='green')
    axs[2, 0].plot(bitstamp_data[bitstamp_data['client_type'] == 'retail']['date'], 
                   bitstamp_data[bitstamp_data['client_type'] == 'retail']['7_day_avg_trading_volume'], 
                   label='Retail', color='blue')
    axs[2, 0].set_title('7-Day Average Trading Volume')
    axs[2, 0].legend()
    
    axs[2, 1].plot(bitstamp_data[bitstamp_data['client_type'] == 'corporate']['date'], 
                   bitstamp_data[bitstamp_data['client_type'] == 'corporate']['7_day_avg_new_clients'], 
                   label='Corporate', color='green')
    axs[2, 1].plot(bitstamp_data[bitstamp_data['client_type'] == 'retail']['date'], 
                   bitstamp_data[bitstamp_data['client_type'] == 'retail']['7_day_avg_new_clients'], 
                   label='Retail', color='blue')
    axs[2, 1].set_title('7-Day Average New Registered Clients')
    axs[2, 1].legend()
    
    
    plt.tight_layout(rect=[0, 0.03, 1, 0.95])
    
    # Save the report as an image file CHANGE THE FILE PATH IF NEEDED
    file_name = f'Task3/Report/bitstamp_daily_report_{report_date.strftime("%Y-%m-%d")}.png'
    plt.savefig(file_name)
    
    plt.show()
    
    print(f"Report saved as {file_name}")

# SET A CUSTOM DATE TO GENERATE THE REPORT
generate_bitstamp_report('31/12/2022')
