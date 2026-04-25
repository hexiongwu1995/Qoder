#import "@preview/spreet:0.1.0"

#let excel_data = spreet.file-decode("No_Defects.xlsx")

#let excel_decode = spreet.decode(read("No_Defects.xlsx", encoding: none))

// #repr(excel_data)

