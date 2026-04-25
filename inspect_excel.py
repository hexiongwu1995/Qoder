import pandas as pd
import sys

excel_file = r"c:\Users\hexiongwu\Documents\VSCode_On_Windows\Qoder\Mendeley_Data\No_Defects.xlsx"

try:
    xls = pd.ExcelFile(excel_file)
    sheet_names = xls.sheet_names
    
    print("="*80)
    print("EXCEL FILE: No_Defects.xlsx")
    print("="*80)
    print(f"Worksheet Names: {sheet_names}")
    print()
    
    for sheet_name in sheet_names:
        print(f"SHEET: {sheet_name}")
        print("-"*80)
        
        df = pd.read_excel(excel_file, sheet_name=sheet_name)
        
        first_3_cols = list(df.columns[:3])
        print(f"First 3 Column Headers: {first_3_cols}")
        
        num_rows = len(df)
        print(f"Number of Data Rows: {num_rows}")
        
        first_3_dtypes = {col: str(df[col].dtype) for col in first_3_cols}
        print(f"Data Types of First 3 Columns: {first_3_dtypes}")
        
        print("First 3 Rows (First 3 Columns Only):")
        sample_df = df.iloc[:3, :3]
        print(sample_df.to_string())
        
        print(f"Total Columns: {len(df.columns)}")
        print(f"All Column Names: {list(df.columns)}")
        print()
except Exception as e:
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
