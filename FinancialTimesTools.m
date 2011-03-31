BeginPackage["FinancialTimesTools`"]

FTReportWindow::usage="";

Begin["Private`"];

ftReports = {"BondsAndRates" -> {{"UK Gilts - Cash Market",
      "UKG"}, {"Official Interest Rates",
      "OINT"}, {"International Money Market Rates",
      "EUR"}, {"FTSE Global Government Bond Indices",
      "FTBO"}, {"International Bond Issues",
      "NIB"}, {"International Bond Issues (Weekly Summary)",
      "WIB"}, {"Index-Linked Bonds",
      "ILB"}, {"Bond and Credit Indices",
      "BOND"}, {"Benchmark Government Bonds",
      "GOV"}, {"Global Investment Grade Bonds",
      "GIG"}, {"High Yield Emerging Market Bonds",
      "EMG"}, {"Ten Year Govt Bond Spreads", "SPR"}, {"Bond Futures",
      "BFUT"}, {"Eurodollar Options",
      "CME4"}, {"Short Sterling Options",
      "STGO"}, {"US Treasury 10 year Options",
      "UST"}, {"Euro Bund Options",
      "EBOP"}, {"Japanese 10 Year Bond Options",
      "JGB"}, {"Riskgrade Volatility", "BVOL"}, {"Gilt Spreads",
      "GSP"}, {"Gilt Strips", "GSS"}, {"Interest Rate Futures",
      "INTF"}, {"Interest Rate Swap Futures",
      "SWAP"}, {"Euribor Options", "EBOR"}, {"FTSE UK Gilts Indices",
      "FTSEG"}, {"Interest Rate Swaps", "ICAP"}, {"Sterling Bonds",
      "STGB"}, {"UK Treasury Bill Tender",
      "BILL"}, {"Tradeable Credit Fixings",
      "FIX"}, {"Markets Interest Summary", "MNY"}, {"Markets Summary",
       "PRCS"}},
   "Commodities" -> {{"FT Commodities and Agriculture Full Table",
      "COM"}, {"Commodity Summary", "KOM"}, {"Markets Summary",
      "PRCS"}},
   "Currencies" -> {{"Currencies Summary",
      "3SPT"}, {"FT Guide to World Currencies",
      "WORL"}, {"Dollar Spot Forward", "DSP"}, {"Euro Spot Forward",
      "ESP"}, {"Pound Spot Forward",
      "PSP"}, {"Dollar against Minor Currencies",
      "DO"}, {"Exchange cross rates",
      "ECR"}, {"Riskgrade FX Volatility",
      "FVOL"}, {"Currency Futures", "CFUT"}, {"OTC options",
      "OTC"}, {"FX - Effective Indices", "BOE"}, {"Markets Summary",
      "PRCS"}},
   "Equities" -> {{"World Equity Markets at a Glance",
      "ENEW"}, {"FTSE Actuaries Share Indices - UK Series",
      "FTUK"}, {"FTSE 100 Summary - Closing Prices",
      "VOL"}, {"FTSE Hourly Indices - UK Series",
      "HR"}, {"FTSE Hedge Indices",
      "HDI"}, {"Dividend and Interest Payments - UK Companies",
      "DIV"}, {"UK Stock Market Trading Data", "UKT"}, {"FT30 Index",
      "IND"}, {"FT Sports Indices", "SP"}, {"UK Market Summary",
      "LSUM"}, {"UK New Highs & Lows", "HIGH"}, {"UK Recent Issues",
      "RCNT"}, {"UK Rises and Falls",
      "RISE"}, {"Investment Co's Split Cap Indices",
      "FDAI"}, {"Plus Market Stocks",
      "OFEX"}, {"UK Company Results Due Next Week",
      "RES"}, {"Last Weeks Preliminary Results",
      "PREL"}, {"Last Weeks Interim Results",
      "INTE"}, {"Current Bids & Mergers - UK Companies",
      "BIDS"}, {"Private Investors' Indices - FTSE",
      "PII"}, {"Permanent Interest Bearing Shares",
      "PIBS"}, {"Winners & Losers - UK Market Weekly",
      "WINL"}, {"FTSE Leaders & Laggards - UK Sectors",
      "LEAD"}, {"FTSE 100 - Latest Week",
      "FTSE"}, {"US Market Summary",
      "ISUM"}, {"FTSE Global Equity Indices",
      "FTW"}, {"FTSE Global Equity Index - by Country",
      "FTC"}, {"FTSE European Indices",
      "FTEE"}, {"Riskgrade  Volatility",
      "EVOL"}, {"Equity Index Futures",
      "IFUT"}, {"Volatility Indices",
      "VIX"}, {"Ratios - Yield & P/E by Country",
      "RAT"}, {"Major Index Weekly Summary",
      "MKT"}, {"World Stock Market Prices",
      "WSM"}, {"UK Equity Options - by Stock",
      "UKOPT"}, {"UK Rights Issues",
      "RIGHT"}, {"FT500 - World's Largest Companies",
      "GLOB"}, {"Markets Summary", "PRCS"}},
   "PersonalFinance" -> {{"Cash ISAS", "ISA"}, {"Credit Cards",
      "CARD"}, {"Money Watch", "MNYW"}, {"Mortgages",
      "MORT"}, {"Savings", "SVGS"}, {"Personal Loans",
      "LOAN"}, {"National Savings & Investments",
      "NSAV"}, {"Retirement Income Snapshot",
      "RET"}, {"Gilt Issues Best Value v Tax Status",
      "GTAX"}, {"Markets Summary", "PRCS"}}};

ftReportURL[code_, date_] :=
 StringJoin[
  "http://markets.ft.com/ft/markets/reports/FTReport.asp?dockey=",
  code, "-", DateString[date, {"Day", "Month", "YearShort"}]]

FTReportWindow[] :=
 Block[
 {},
 CreateDocument[
  With[{items =
     Labeled[Column[
         Hyperlink[Style[#1, Blue], ftReportURL[#2, DatePlus[DateList[],{-1,"Day"}]],
            Appearance -> "Frameless"] & @@@ Sort[#2]], #1, Top] & @@@
       ftReports},
   Panel@Grid[
     List@{items[[4]], items[[1]],
       Column[items[[{2, 3, 5}]], Spacings -> 3]}, Alignment -> Top,
     Frame -> All]],WindowTitle -> "Financial Times", Savable -> False, Magnification -> 1.2, WindowSize -> All];
     Null
     ]

End[];
EndPackage[];