# Task 3: Daily Performance Report Generator

This part of the project generates daily performance reports for Bitstamp's management, providing a clear overview of key metrics on any selected date.

## How to Use the Report Generator

### 1. Clone the Repository

To use the report generator, first, clone this repository to your local machine:
```
git clone https://github.com/korentmaj/bitstamp_DI_analyst_Chlng_h234sdd.git
cd bitstamp_DI_analyst_Chlng_h234sdd/Task3
```
### 2. View Existing Reports

If you're only interested in looking at already generated reports, you can find them in the Reports/ folder. These reports were created using specific dates and include all the key performance metrics required by Bitstamp.

### 3. Generate Your Own Reports

To generate a report with a custom date or dataset, follow these steps:

1. **Open the Script**: Open pltReport_generator.py in any text editor or IDE (such as VS Code).
2. **Find the Date Entry**: Scroll down to the part of the code where the date is entered. It will look something like this:
    ```
   generate_bitstamp_report('07/12/2022')
    ```
   Change the date to your preferred date in the format 'DD/MM/YYYY'.

3. **Use Custom Datasets**: If you have your own dataset you'd like to analyze, you can also import it by specifying the path to your custom dataset:
    ```
   file_path = 'path/to/your/custom_dataset.csv'
    ```
   Ensure your dataset has similar columns (Date, Exchange, Trading_Pair, Volume) so that the script can process it correctly.

4. **Run the Script**: Once you've set the date or dataset, run the script:
    ```
   python pltReport_generator.py
    ```
   A new report will be generated and saved in the Reports/ folder.

### 4. File Format and Export

The report is saved as a .png file by default in the Reports/ folder. You can choose to export it in any format you prefer, such as .jpg, .pdf, etc., but in this project, I chose .png to keep the file size small.

## Why Use Matplotlib Instead of Excel or Tableau?

For this project, I chose to use **Matplotlib** instead of traditional tools like Excel or Tableau for a few reasons:

1. **To Stand Out**: Most candidates might use Excel or Tableau, but I wanted to showcase my Python and data visualization skills by using a programmatic tool like Matplotlib.
2. **Memory Efficiency**: The entire program, when run on this dataset, uses less than 1KB of memory, making it incredibly efficient. This is a key advantage when processing larger datasets or running multiple reports.
3. **Flexibility**: Using Matplotlib allowed me to build a fully customizable report generator, where users can input any date or dataset, adjust the visuals, and export in the format of their choice.

---

### Example Workflow:

1. **Change the Date**:

   generate_bitstamp_report('15/08/2024')
   
2. **Run the Script**:

   python pltReport_generator.py

3. **Find Your Report**: A new report, Report15082024.png, will be saved inside the Reports/ folder.
