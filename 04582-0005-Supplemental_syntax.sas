/*-------------------------------------------------------------------------
 |                                                                         
 |             SAS SUPPLEMENTAL SYNTAX FILE FOR ICPSR 04582
 |           NATIONAL SURVEY OF AMERICA'S FAMILIES (NSAF), 2002
 |                (DATASET 0005:  FAMILY-RESPONDENT DATA)
 |
 |
 | This SAS program is provided for optional use with the SAS transport
 | version of this data file as distributed by ICPSR. The metadata provided
 | below are not stored in the SAS transport version of this data
 | collection.  Users need to use SAS PROC COPY to copy the SAS transport
 | file to a SAS data set on their system. This program can then be used in
 | conjunction with the SAS system data file.
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions.  Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set. Users
 | should replace "SAS-dataset" with their name for the SAS data set copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS data set name to make a permanent SAS data set.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .;
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables stored in the SAS data set. Users can refer to their
 | SAS manual for information on how to permanently store formats in a
 | SAS catalog.
 |
 | NOTE:  Users should modify this file to suit their specific needs.
 | The MISSING VALUE RECODES section has been commented out (i.e., '/*').
 | To make this section active in the program, users should remove the SAS
 | comment indicators from this section.
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

PROC FORMAT;
  VALUE kashlp2a  -1='Inapplicable' ;
  VALUE $mainrsf  'CO'='(CO) Complete' 'CP'='(CP) Partial complete - section k done' ;
  VALUE $typeint  'A1'='(A1) Option A with first MKA'
                  'A2'='(A2) Option A with secnd MKA-both same family'
                  'A3'='(A3) Option A with secnd MKA-not same family'
                  'B1'='(B1) Option B with first adult'
                  'B2'='(B2) Option B with secnd adult-both same faml'
                  'B3'='(B3) Option B with secnd adult-not same famly'
                  'B4'='(B4) Option B with emancipated minor' ;
  VALUE $xownref  '0'='(0) Not imputed'
                  '1'='(1) .D (-8), .N (-9), .R (-7) imputed to a non-missing value'
                  '3'='(3) Non-missing value edited to another non-mis' ;
  VALUE $xmedhmo  '0'='(0) Not imputed'
                  '1'='(1) .D (-8), .N (-9), .R (-7) imputed to a non-missing value'
                  '3'='(3) Non-missing value edited to another non-mis'
                  '5'='(5) .I (-1) edited to non-missing value' ;
  VALUE $xmedlst  '0'='(0) Not imputed'
                  '1'='(1) .D (-8), .N (-9), .R (-7) imputed to a non-missing value'
                  '2'='(2) .D (-8), .N (-9), .R (-7) edited to .I (-1)'
                  '3'='(3) Non-missing value edited to another non-mis'
                  '5'='(5) .I (-1) edited to non-missing value' ;
  VALUE $xlisten  '0'='(0) Not imputed'
                  '1'='(1) .D (-8), .N (-9), .R (-7) imputed to a non-missing value' ;
  VALUE $state    'AK'='(AK) Alaska' 'AL'='(AL) Alabama' 'AR'='(AR) Arkansas' 'AZ'='(AZ) Arizona'
                  'CA'='(CA) California' 'CO'='(CO) Colorado' 'CT'='(CT) Connecticut'
                  'DC'='(DC) District of Columbia' 'DE'='(DE) Delaware' 'FL'='(FL) Florida'
                  'GA'='(GA) Georgia' 'HI'='(HI) Hawaii' 'IA'='(IA) Iowa' 'ID'='(ID) Idaho'
                  'IL'='(IL) Illinois' 'IN'='(IN) Indiana' 'KS'='(KS) Kansas'
                  'KY'='(KY) Kentucky' 'LA'='(LA) Lousiana' 'MA'='(MA) Massachusetts'
                  'MD'='(MD) Maryland' 'ME'='(ME) Maine' 'MI'='(MI) Michigan'
                  'MN'='(MN) Minnesota' 'MO'='(MO) Missouri' 'MS'='(MS) Mississippi'
                  'MT'='(MT) Montana' 'NC'='(NC) North Carolina' 'ND'='(ND) North Dakota'
                  'NE'='(NE) Nebraska' 'NH'='(NH) New Hampshire' 'NJ'='(NJ) New Jersey'
                  'NM'='(NM) New Mexico' 'NV'='(NV) Nevada' 'NY'='(NY) New York' 'OH'='(OH) Ohio'
                  'OK'='(OK) Oklahoma' 'OR'='(OR) Oregon' 'PA'='(PA) Pennsylvania'
                  'RI'='(RI) Rhode Island' 'SC'='(SC) South Carolina'
                  'SD'='(SD) South Dakota' 'TN'='(TN) Tennessee' 'TX'='(TX) Texas'
                  'UT'='(UT) Utah' 'VA'='(VA) Virginia' 'VT'='(VT) Vermont'
                  'WA'='(WA) Washington' 'WI'='(WI) Wisconsin' 'WV'='(WV) West Virginia'
                  'WY'='(WY) Wyoming' ;
  VALUE $site     '01'='(01) Alabama' '02'='(02) California' '03'='(03) Florida'
                  '04'='(04) Massachusetts' '05'='(05) Michigan' '06'='(06) Minnesota'
                  '07'='(07) New Jersey' '08'='(08) New York' '10'='(10) Texas'
                  '11'='(11) Washington' '13'='(13) Mississippi' '15'='(15) Wisconsin'
                  '16'='(16) Balance of US' '18'='(18) Colorado' ;
  VALUE $uregion  '1'='(1) Northeast' '2'='(2) Midwest' '3'='(3) South' '4'='(4) West' ;
  VALUE $xoutpof  '0'='(0) Not imputed'
                  '1'='(1) .D (-8), .N (-9), .R (-7) imputed to a non-missing value'
                  '5'='(5) .I (-1) edited to non-missing value' ;
  VALUE bsatmed   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' 1='(1) Very satisfied'
                  2='(2) Somewhat satisfied' 3='(3) Somewhat dissatisfied'
                  4='(4) Very dissatisfied' ;
  VALUE bconmed   1='(1) Extremely confident' 2='(2) Very confident'
                  3='(3) Somewhat confident' 4='(4) Not too confident'
                  5='(5) Not confident at all' ;
  VALUE blisten   1='(1) Never' 2='(2) Sometimes' 3='(3) Usually' 4='(4) Always'
                  5='(5) No visits' ;
  VALUE bnowel    -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE emedhmo   -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE emedlst   -1='Inapplicable' 1='(1) Any doctor or clinic'
                  2='(2) Must choose from directory or list' ;
  VALUE emedpcd   -1='Inapplicable' ;
  VALUE emedref   -1='Inapplicable' ;
  VALUE fnomed    -8='Don''t Know' -7='Refused to Answer' 1='(1) Yes' 2='(2) No' ;
  VALUE fnoden    -8='Don''t Know' -7='Refused to Answer' 1='(1) Yes' 2='(2) No' ;
  VALUE fnodrg    -8='Don''t Know' -7='Refused to Answer' 1='(1) Yes' 2='(2) No' ;
  VALUE foutpokf  -1='Inapplicable' 1='(1) Less than $500'
                  2='(2) $500 to less than $2000' 3='(3) $2000 to less than $3000'
                  4='(4) $3000 to less than $5000' 5='(5) $5000 or more' ;
  VALUE janypub   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jafdcf    -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jsafdcf   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jgaf      -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jlumpsum  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jvouchef  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jfstampf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jchildf   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jfosterf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jfrelf    -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE junempf   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jwcomvef  -1='Inapplicable' ;
  VALUE jwcomp    1='(1) Yes' 2='(2) No' ;
  VALUE jwvetb    1='(1) Yes' 2='(2) No' ;
  VALUE jsupsecf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jsocsecf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jpenannf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jintdivf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jrentalf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jothincf  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jafdca1f  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) The child/children only' 2='(2) You/Adults only' 3='(3) Both' ;
  VALUE jsupkid   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Child'
                  2='(2) Adult' 3='(3) Both' ;
  VALUE jabpov    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Below'
                  2='(2) Above' ;
  VALUE jab2pov   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Below' 2='(2) Above' ;
  VALUE jab4pov   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Below' 2='(2) Above' ;
  VALUE jowncar   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE jothtypc  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Earnings' 2='(2) AFDC' 3='(3) General assistance'
                  4='(4) Emergency assistance' 5='(5) Child support' 6='(6) Foster care'
                  7='(7) Financial assistance from friends/relatives'
                  8='(8) Unemployment Compensation'
                  9='(9) Workers compensation or veterans payments'
                  10='(10) Supplemental Security Income' 11='(11) Social Security'
                  12='(12) Pensions' 13='(13) Interest or dividends' 14='(14) Rental income'
                  15='(15) WIC' 16='(16) Job Corps or JTPA'
                  17='(17) Other means-tested cash benefits'
                  18='(18) Royalties; Estate income; Trust income'
                  19='(19) Stock options or deferred compensation'
                  20='(20) Disability Income' 21='(21) Alimony'
                  22='(22) Educational assistance' 23='(23) Agricultural payments'
                  24='(24) Other income, taxable' 25='(25) Other income, not taxable'
                  27='(27) EITC Refund' 28='(28) Housing assistance'
                  29='(29) Energy assistance' 30='(30) Other means-tested non-cash'
                  31='(31) Capital gains' 32='(32) Sale of property'
                  33='(33) Cashing out financial assets'
                  34='(34) Other lump sum amount' 35='(35) Cannot Identify'
                  36='(36) Veteran''s payments'
                  37='(37) Social security disability insurance' ;
  VALUE kafdc     -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kafdcunt  -8='Don''t Know' -1='Inapplicable' 1='(1) Months' 2='(2) Years' ;
  VALUE kar1styr  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable' ;
  VALUE kargt5yr  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE karjan9f  -8='Don''t Know' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kasjan9f  -8='Don''t Know' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kaswhy    -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Cut off by welfare office' 2='(2) Own decision' ;
  VALUE kaslefta  1='(1) Got a job' 2='(2) Same job, worked more hrs, or got a raise'
                  3='(3) Got a better job 0.07' 4='(4) Married/remarried 0.04'
                  5='(5) Moved in with family 0.05'
                  6='(6) Moved to another county/state 0.05'
                  7='(7) Did not want it or need it/uninterested 0.19'
                  8='(8) Received money from another source 0.08'
                  9='(9) System too frustrating/too much hassle 0.06'
                  10='(10) Earnings too high (reason unknown) 0.01'
                  11='(11) Income too high (type unknown) 0.01'
                  13='(13) Assets were too high 0.01'
                  14='(14) Did not follow program rules 0.03'
                  15='(15) Unclassifiable 0.05' ;
  VALUE kasleftb  -1='Inapplicable' 1='(1) Got a job'
                  2='(2) Same job, worked more hrs, or got a raise'
                  3='(3) Got a better job' 4='(4) Married/remarried'
                  5='(5) Moved in with family' 6='(6) Moved to another county/state'
                  7='(7) Did not want it or need it/uninterested'
                  8='(8) Received money from another source'
                  9='(9) System too frustrating/too much hassle'
                  14='(14) Did not follow program rules' 15='(15) Unclassifiable' ;
  VALUE kasleftc  -1='Inapplicable' 3='(3) Got a better job' ;
  VALUE kascuta   -8='Don''t Know' -1='Inapplicable'
                  1='(1) Earnings had increased' 2='(2) Assets were too high'
                  3='(3) Did not follow program rules'
                  4='(4) Reached end of time limit allowed' 5='(5) Not a US citizen'
                  6='(6) Receiving money from other source'
                  7='(7) Administrative problems/mix up'
                  8='(8) Change in family situation'
                  9='(9) Didnt want or need/too much hassle' 10='(10) Moved'
                  11='(11) Unclassifiable' ;
  VALUE kascutb   -1='Inapplicable' 1='(1) Earnings had increased'
                  2='(2) Assets were too high' 3='(3) Did not follow program rules'
                  4='(4) Reached end of time limit allowed'
                  6='(6) Receiving money from other source'
                  8='(8) Change in family situation' ;
  VALUE kashlp1a  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kashlp1b  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kashlp1c  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kasjobt   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kareduce  -8='Don''t Know' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE karedya   -8='Don''t Know' -1='Inapplicable'
                  1='(1) Earnings had increased' 2='(2) Assets were too high'
                  3='(3) Did not follow program rules'
                  4='(4) Reached end of time limit allowed'
                  6='(6) Receiving money from other source'
                  7='(7) Administrative problems/mix up'
                  8='(8) Change in family situation' 10='(10) Moved'
                  11='(11) Unclassifiable' ;
  VALUE karedyb   -1='Inapplicable' 1='(1) Earnings had increased'
                  2='(2) Assets were too high' 3='(3) Did not follow program rules' ;
  VALUE karedyc   -1='Inapplicable' ;
  VALUE kafdcapp  -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kaoffhlp  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kafdcnow  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kalimit   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kalongun  -1='Inapplicable' 1='(1) Months' 2='(2) Years' ;
  VALUE kalchkm   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) January' 2='(2) February' 3='(3) March' 4='(4) April' 5='(5) May'
                  6='(6) June' 7='(7) July' 8='(8) August' 9='(9) September' 10='(10) October'
                  11='(11) November' 12='(12) December' ;
  VALUE kafora    -8='Don''t Know' -1='Inapplicable' 1='(1) Just children'
                  2='(2) MKA and children' ;
  VALUE kaforb    -8='Don''t Know' -1='Inapplicable' 1='(1) Just children'
                  2='(2) MKA and children' 3='(3) MKA, spouse/partner and children'
                  4='(4) Just spouse/partner and children' ;
  VALUE kalstopm  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) January' 2='(2) February' 3='(3) March' 4='(4) April' 5='(5) May'
                  6='(6) June' 7='(7) July' 8='(8) August' 9='(9) September' 10='(10) October'
                  11='(11) November' 12='(12) December' ;
  VALUE kalstopy  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable' ;
  VALUE kfever    -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kfunt     -8='Don''t Know' -1='Inapplicable' 1='(1) Months' 2='(2) Years' ;
  VALUE kf1styr   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' ;
  VALUE kfgt5yr   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kfrjan9f  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kfsjan9f  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kfystop   -9='Not Ascertained' -8='Don''t Know' -1='Inapplicable'
                  1='(1) Cut off by food stamp office' 2='(2) Own decision' ;
  VALUE kfylfta   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Got a job' 2='(2) Same job, worked more hrs, or got a raise'
                  3='(3) Got a better job' 4='(4) Married/remarried'
                  5='(5) Moved in with family' 6='(6) Moved to another county/state'
                  7='(7) Did not want it or need it/uninterested'
                  8='(8) Received money from another source'
                  9='(9) System too frustrating/too much hassle'
                  10='(10) Earnings too high (reason unknown)'
                  11='(11) Income too high (type unknown)'
                  13='(13) Assets were too high' 14='(14) Did not follow program rules'
                  15='(15) Unclassifiable' ;
  VALUE kfylftb   -1='Inapplicable' 1='(1) Got a job'
                  2='(2) Same job, worked more hrs, or got a raise'
                  3='(3) Got a better job' 4='(4) Married/remarried'
                  5='(5) Moved in with family' 6='(6) Moved to another county/state'
                  7='(7) Did not want it or need it/uninterested'
                  8='(8) Received money from another source'
                  9='(9) System too frustrating/too much hassle'
                  10='(10) Earnings too high (reason unknown)'
                  11='(11) Income too high (type unknown)'
                  14='(14) Did not follow program rules' ;
  VALUE kfylftc   -1='Inapplicable' 3='(3) Got a better job' ;
  VALUE kfycuta   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Earnings had increased' 2='(2) Assets were too high'
                  3='(3) Did not follow program rules'
                  4='(4) Reached end of time limit allowed' 5='(5) Not a US citizen'
                  6='(6) Receiving money from other source'
                  7='(7) Administrative problems/mix up'
                  8='(8) Change in family situation'
                  9='(9) Didnt want or need/too much hassle' 10='(10) Moved'
                  11='(11) Unclassifiable' ;
  VALUE kfycutb   -1='Inapplicable' 1='(1) Earnings had increased'
                  2='(2) Assets were too high' 3='(3) Did not follow program rules'
                  4='(4) Reached end of time limit allowed'
                  6='(6) Receiving money from other source'
                  7='(7) Administrative problems/mix up'
                  8='(8) Change in family situation' 10='(10) Moved'
                  11='(11) Unclassifiable' ;
  VALUE kfycutc   -1='Inapplicable' 3='(3) Did not follow program rules' ;
  VALUE kfnow     -9='Not Ascertained' -8='Don''t Know' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kfcond    -8='Don''t Know' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kfapp2yr  -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kflastm   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) January'
                  2='(2) February' 3='(3) March' 4='(4) April' 5='(5) May' 6='(6) June' 7='(7) July'
                  8='(8) August' 9='(9) September' 10='(10) October' 11='(11) November'
                  12='(12) December' ;
  VALUE kflasty   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' ;
  VALUE kwic      -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kbreak    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE klunch    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE kgetcare  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kaskcare  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE knocarea  -8='Don''t Know' -1='Inapplicable'
                  1='(1) Not eligible/ make too much money'
                  2='(2) Assistance not available' 3='(3) Put on waiting list'
                  4='(4) Discouraged/ gave up/ too much hassle'
                  5='(5) Decided didn''t want/need help from govt' 91='(91) Other' ;
  VALUE knocareb  -1='Inapplicable' 1='(1) Not eligible/ make too much money'
                  2='(2) Assistance not available' 3='(3) Put on waiting list'
                  4='(4) Discouraged/ gave up/ too much hassle' 91='(91) Other' ;
  VALUE knocarec  -1='Inapplicable' 3='(3) Put on waiting list'
                  5='(5) Decided didn''t want/need help from govt' ;
  VALUE keitchrd  -8='Don''t Know' -7='Refused to Answer' 1='(1) Yes' 2='(2) No' ;
  VALUE keitcrec  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE keitcyr   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE ktaxfed   -8='Don''t Know' -7='Refused to Answer' 1='(1) You'
                  2='(2) Spouse/Partner''s name'
                  3='(3) You and Spouse/Partner''s name' 4='(4) Someone else'
                  5='(5) Or did you not have to file taxes?' ;
  VALUE ktaxhelp  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kchdsup   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE kdisben   -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE lunpjb    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE lvouchr   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE ljbclas   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' 1='(1) Yes' 2='(2) No' ;
  VALUE ltrain    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE lhscls    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE lcredit   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE mliveun   -1='Inapplicable' 1='(1) Months' 2='(2) Years' ;
  VALUE minstate  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) In state' 2='(2) Out of state' ;
  VALUE mfdworry  -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Often true'
                  2='(2) Sometimes true' 3='(3) Never true' ;
  VALUE mfdlack   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Often true'
                  2='(2) Sometimes true' 3='(3) Never true' ;
  VALUE mcutmeal  -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE mcutoft   -8='Don''t Know' -1='Inapplicable' 1='(1) Almost every month'
                  2='(2) Some months but not every month' 3='(3) Only 1 or 2 months' ;
  VALUE mpayrent  -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' 1='(1) Yes' 2='(2) No' ;
  VALUE mmoveout  -8='Don''t Know' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE mloan     -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE memgfood  -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE mfoodpla  -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) A church or church-related group' 2='(2) A community group'
                  3='(3) A government agency' 4='(4) Family/friends'
                  5='(5) Church and community prgms' 6='(6) Other' ;
  VALUE nrisk     1='(1) Definitely true' 2='(2) Mostly true' 3='(3) Mostly false'
                  4='(4) Definitely false' ;
  VALUE itotfam   -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Yes' 2='(2) No' ;
  VALUE iarrng    -8='Don''t Know' -7='Refused to Answer' -1='Inapplicable'
                  1='(1) Yes' 2='(2) No' ;
  VALUE ufc1rel   -1='Inapplicable' 10='(10) Biological parent'
                  11='(11) Adoptive parent' 12='(12) Step parent'
                  13='(13) Unrelated foster parent' 14='(14) Partner parent'
                  15='(15) Other type parent'
                  26='(26) DK type FC, par. mar. to bio/adpt par' 30='(30) Grandparent'
                  31='(31) Great grandparent' 33='(33) Great grandchild'
                  34='(34) Aunt/uncle' 35='(35) Great aunt/uncle' 37='(37) Cousin'
                  38='(38) Sibling' 50='(50) Other relative' 51='(51) Non-relative'
                  190='(190) Unrelated legal guardian' ;
  VALUE ufc2rel   -9='Not Ascertained' -7='Refused to Answer'
                  -1='Inapplicable' 1='(1) Self' 3='(3) Unmarried partner'
                  10='(10) Biological parent' 11='(11) Adoptive parent'
                  12='(12) Step parent' 13='(13) Unrelated foster parent'
                  14='(14) Partner parent' 15='(15) Other type parent'
                  26='(26) DK type FC, par. mar. to bio/adpt par' 30='(30) Grandparent'
                  31='(31) Great grandparent' 34='(34) Aunt/uncle'
                  35='(35) Great aunt/uncle' 36='(36) Niece/nephew' 37='(37) Cousin'
                  38='(38) Sibling' 40='(40) Sister/brother-in-law' 50='(50) Other relative'
                  51='(51) Non-relative' 190='(190) Unrelated legal guardian' ;
  VALUE umka1rel  -7='Refused to Answer' -1='Inapplicable' 1='(1) Self'
                  2='(2) Spouse' 3='(3) Unmarried partner' 10='(10) Biological parent'
                  12='(12) Step parent' 13='(13) Unrelated foster parent'
                  15='(15) Other type parent' 25='(25) Other type child'
                  30='(30) Grandparent' 32='(32) Grandchild' 34='(34) Aunt/uncle'
                  36='(36) Niece/nephew' 37='(37) Cousin' 38='(38) Sibling'
                  39='(39) Daughter/son-in-law' 40='(40) Sister/brother-in-law'
                  41='(41) Mother/father-in-law' 42='(42) Other other partner'
                  50='(50) Other relative' 51='(51) Non-relative' ;
  VALUE umka2rel  -9='Not Ascertained' -8='Don''t Know' -1='Inapplicable'
                  1='(1) Self' 2='(2) Spouse' 3='(3) Unmarried partner'
                  15='(15) Other type parent' 20='(20) Biological child'
                  22='(22) Step child' 23='(23) Unrelated foster child'
                  25='(25) Other type child' 30='(30) Grandparent' 32='(32) Grandchild'
                  34='(34) Aunt/uncle' 36='(36) Niece/nephew' 37='(37) Cousin' 38='(38) Sibling'
                  39='(39) Daughter/son-in-law' 40='(40) Sister/brother-in-law'
                  41='(41) Mother/father-in-law' 42='(42) Other other partner'
                  50='(50) Other relative' 51='(51) Non-relative' ;
  VALUE ub1rel    -9='Not Ascertained' -8='Don''t Know'
                  -7='Refused to Answer' -1='Inapplicable' 1='(1) Self'
                  15='(15) Other type parent' 25='(25) Other type child'
                  30='(30) Grandparent' 32='(32) Grandchild' 34='(34) Aunt/uncle'
                  36='(36) Niece/nephew' 37='(37) Cousin' 38='(38) Sibling'
                  39='(39) Daughter/son-in-law' 40='(40) Sister/brother-in-law'
                  41='(41) Mother/father-in-law' 50='(50) Other relative'
                  51='(51) Non-relative' ;
  VALUE ub2rel    -7='Refused to Answer' -1='Inapplicable' 1='(1) Self'
                  15='(15) Other type parent' 25='(25) Other type child'
                  30='(30) Grandparent' 32='(32) Grandchild' 34='(34) Aunt/uncle'
                  36='(36) Niece/nephew' 37='(37) Cousin' 38='(38) Sibling'
                  39='(39) Daughter/son-in-law' 40='(40) Sister/brother-in-law'
                  41='(41) Mother/father-in-law' 50='(50) Other relative'
                  51='(51) Non-relative' ;
  VALUE uspa1rel  -1='Inapplicable' 1='(1) Self' 2='(2) Spouse' 3='(3) Unmarried partner'
                  15='(15) Other type parent' 25='(25) Other type child'
                  30='(30) Grandparent' 32='(32) Grandchild' 34='(34) Aunt/uncle'
                  36='(36) Niece/nephew' 37='(37) Cousin' 38='(38) Sibling'
                  39='(39) Daughter/son-in-law' 40='(40) Sister/brother-in-law'
                  41='(41) Mother/father-in-law' 42='(42) Other other partner'
                  50='(50) Other relative' 51='(51) Non-relative' ;
  VALUE uspa2rel  -9='Not Ascertained' -7='Refused to Answer'
                  -1='Inapplicable' 1='(1) Self' 2='(2) Spouse' 3='(3) Unmarried partner'
                  15='(15) Other type parent' 20='(20) Biological child'
                  25='(25) Other type child' 32='(32) Grandchild' 34='(34) Aunt/uncle'
                  35='(35) Great aunt/uncle' 36='(36) Niece/nephew' 37='(37) Cousin'
                  38='(38) Sibling' 39='(39) Daughter/son-in-law'
                  40='(40) Sister/brother-in-law' 41='(41) Mother/father-in-law'
                  42='(42) Other other partner' 50='(50) Other relative'
                  51='(51) Non-relative' ;
  VALUE uspb1rel  -1='Inapplicable' 2='(2) Spouse' 3='(3) Unmarried partner'
                  10='(10) Biological parent' 15='(15) Other type parent'
                  25='(25) Other type child' 32='(32) Grandchild' 34='(34) Aunt/uncle'
                  36='(36) Niece/nephew' 37='(37) Cousin' 38='(38) Sibling'
                  39='(39) Daughter/son-in-law' 40='(40) Sister/brother-in-law'
                  41='(41) Mother/father-in-law' 50='(50) Other relative'
                  51='(51) Non-relative' ;
  VALUE uspb2rel  -8='Don''t Know' -1='Inapplicable' 2='(2) Spouse'
                  3='(3) Unmarried partner' 15='(15) Other type parent'
                  25='(25) Other type child' 32='(32) Grandchild' 36='(36) Niece/nephew'
                  37='(37) Cousin' 38='(38) Sibling' 39='(39) Daughter/son-in-law'
                  40='(40) Sister/brother-in-law' 41='(41) Mother/father-in-law'
                  50='(50) Other relative' 51='(51) Non-relative' ;
  VALUE uemrel    -1='Inapplicable' 1='(1) Self' 2='(2) Spouse' 51='(51) Non-relative' ;
  VALUE uspemrel  -1='Inapplicable' 1='(1) Self' 2='(2) Spouse' 3='(3) Unmarried partner'
                  51='(51) Non-relative' ;
RUN;

* SAS DATA STEP;
DATA;
SET SAS-dataset ;

***********************************************************
The following code changes the -[number] missing values to 
the .[character] missing values. To use this code, remove the 
"*" at the beginning of each line of code to allow the code to 
run.  To retain the -[number] missing values, leave the code
"as is" (commented out).
***********************************************************;
* array num _numeric_;     /* array of all numeric variables */
* array char _character_;  /* array of all character variables */
* do over num;
* if num in (-1,.) then num=.I;
* if num=-7 then num=.R;
* if num=-8 then num=.D;
* if num =-9 then num=.N;
* end;
* do over char;
* if char in ('-1',' ','.') then char='.I';
* if char='-7' then char='.R';
* if char='-8' then char='.D';
* if char ='-9' then char='.N';
* end;
* run;

* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (KASHLP2A = -1) THEN KASHLP2A = .;
   IF (BSATMED = -9 OR BSATMED = -8 OR BSATMED = -7) THEN BSATMED = .;
   IF (BNOWEL = -8 OR BNOWEL = -7 OR BNOWEL = -1) THEN BNOWEL = .;
   IF (EMEDHMO = -1) THEN EMEDHMO = .;
   IF (EMEDLST = -1) THEN EMEDLST = .;
   IF (EMEDPCD = -1) THEN EMEDPCD = .;
   IF (EMEDREF = -1) THEN EMEDREF = .;
   IF (FNOMED = -8 OR FNOMED = -7) THEN FNOMED = .;
   IF (FNODEN = -8 OR FNODEN = -7) THEN FNODEN = .;
   IF (FNODRG = -8 OR FNODRG = -7) THEN FNODRG = .;
   IF (FOUTPOK2 = -1) THEN FOUTPOK2 = .;
   IF (JANYPUB = -8 OR JANYPUB = -7 OR JANYPUB = -1) THEN JANYPUB = .;
   IF (JAFDCF = -8 OR JAFDCF = -7 OR JAFDCF = -1) THEN JAFDCF = .;
   IF (JSAFDCF = -8 OR JSAFDCF = -7 OR JSAFDCF = -1) THEN JSAFDCF = .;
   IF (JGAF = -8 OR JGAF = -7 OR JGAF = -1) THEN JGAF = .;
   IF (JLUMPSUM = -8 OR JLUMPSUM = -7 OR JLUMPSUM = -1) THEN JLUMPSUM = .;
   IF (JVOUCHEF = -8 OR JVOUCHEF = -7 OR JVOUCHEF = -1) THEN JVOUCHEF = .;
   IF (JFSTAMPF = -8 OR JFSTAMPF = -7 OR JFSTAMPF = -1) THEN JFSTAMPF = .;
   IF (JCHILDF = -8 OR JCHILDF = -7 OR JCHILDF = -1) THEN JCHILDF = .;
   IF (JFOSTERF = -8 OR JFOSTERF = -7 OR JFOSTERF = -1) THEN JFOSTERF = .;
   IF (JFRELF = -8 OR JFRELF = -7 OR JFRELF = -1) THEN JFRELF = .;
   IF (JUNEMPF = -8 OR JUNEMPF = -7 OR JUNEMPF = -1) THEN JUNEMPF = .;
   IF (JWCOMVEF = -1) THEN JWCOMVEF = .;
   IF (JSUPSECF = -8 OR JSUPSECF = -7 OR JSUPSECF = -1) THEN JSUPSECF = .;
   IF (JSOCSECF = -8 OR JSOCSECF = -7 OR JSOCSECF = -1) THEN JSOCSECF = .;
   IF (JPENANNF = -8 OR JPENANNF = -7 OR JPENANNF = -1) THEN JPENANNF = .;
   IF (JINTDIVF = -8 OR JINTDIVF = -7 OR JINTDIVF = -1) THEN JINTDIVF = .;
   IF (JRENTALF = -8 OR JRENTALF = -7 OR JRENTALF = -1) THEN JRENTALF = .;
   IF (JOTHINCF = -8 OR JOTHINCF = -7 OR JOTHINCF = -1) THEN JOTHINCF = .;
   IF (JAFDCA1 = -8 OR JAFDCA1 = -7 OR JAFDCA1 = -1) THEN JAFDCA1 = .;
   IF (JSUPKID >= -9 AND JSUPKID <= -1) THEN JSUPKID = .;
   IF (JABPOV >= -9 AND JABPOV <= -1) THEN JABPOV = .;
   IF (JAB2POV = -8 OR JAB2POV = -7 OR JAB2POV = -1) THEN JAB2POV = .;
   IF (JAB4POV = -8 OR JAB4POV = -7 OR JAB4POV = -1) THEN JAB4POV = .;
   IF (JOWNCAR = -8 OR JOWNCAR = -7 OR JOWNCAR = -1) THEN JOWNCAR = .;
   IF (JOTHTYPC = -8 OR JOTHTYPC = -7 OR JOTHTYPC = -1) THEN JOTHTYPC = .;
   IF (KAFDC = -8 OR KAFDC = -7 OR KAFDC = -1) THEN KAFDC = .;
   IF (KAFDCUNT = -8 OR KAFDCUNT = -1) THEN KAFDCUNT = .;
   IF (KAR1STYR = -8 OR KAR1STYR = -7 OR KAR1STYR = -1) THEN KAR1STYR = .;
   IF (KARGT5YR = -8 OR KARGT5YR = -7 OR KARGT5YR = -1) THEN KARGT5YR = .;
   IF (KARJAN95 = -8 OR KARJAN95 = -1) THEN KARJAN95 = .;
   IF (KASJAN95 = -8 OR KASJAN95 = -1) THEN KASJAN95 = .;
   IF (KASWHY = -8 OR KASWHY = -7 OR KASWHY = -1) THEN KASWHY = .;
   IF (KASLEFTB = -1) THEN KASLEFTB = .;
   IF (KASLEFTC = -1) THEN KASLEFTC = .;
   IF (KASCUTA = -8 OR KASCUTA = -1) THEN KASCUTA = .;
   IF (KASCUTB = -1) THEN KASCUTB = .;
   IF (KASHLP1A = -8 OR KASHLP1A = -7 OR KASHLP1A = -1) THEN KASHLP1A = .;
   IF (KASHLP1B = -8 OR KASHLP1B = -7 OR KASHLP1B = -1) THEN KASHLP1B = .;
   IF (KASHLP1C = -8 OR KASHLP1C = -7 OR KASHLP1C = -1) THEN KASHLP1C = .;
   IF (KASJOBT = -8 OR KASJOBT = -7 OR KASJOBT = -1) THEN KASJOBT = .;
   IF (KAREDUCE = -8 OR KAREDUCE = -1) THEN KAREDUCE = .;
   IF (KAREDYA = -8 OR KAREDYA = -1) THEN KAREDYA = .;
   IF (KAREDYB = -1) THEN KAREDYB = .;
   IF (KAREDYC = -1) THEN KAREDYC = .;
   IF (KAFDCAPP >= -9 AND KAFDCAPP <= -1) THEN KAFDCAPP = .;
   IF (KAOFFHLP = -8 OR KAOFFHLP = -7 OR KAOFFHLP = -1) THEN KAOFFHLP = .;
   IF (KAFDCNOW = -8 OR KAFDCNOW = -7 OR KAFDCNOW = -1) THEN KAFDCNOW = .;
   IF (KALIMIT = -8 OR KALIMIT = -7 OR KALIMIT = -1) THEN KALIMIT = .;
   IF (KALONGUN = -1) THEN KALONGUN = .;
   IF (KALCHKM = -8 OR KALCHKM = -7 OR KALCHKM = -1) THEN KALCHKM = .;
   IF (KAFORA = -8 OR KAFORA = -1) THEN KAFORA = .;
   IF (KAFORB = -8 OR KAFORB = -1) THEN KAFORB = .;
   IF (KALSTOPM = -8 OR KALSTOPM = -7 OR KALSTOPM = -1) THEN KALSTOPM = .;
   IF (KALSTOPY = -8 OR KALSTOPY = -7 OR KALSTOPY = -1) THEN KALSTOPY = .;
   IF (KFEVER = -8 OR KFEVER = -7 OR KFEVER = -1) THEN KFEVER = .;
   IF (KFUNT = -8 OR KFUNT = -1) THEN KFUNT = .;
   IF (KF1STYR >= -9 AND KF1STYR <= -1) THEN KF1STYR = .;
   IF (KFGT5YR >= -9 AND KFGT5YR <= -1) THEN KFGT5YR = .;
   IF (KFRJAN95 = -8 OR KFRJAN95 = -7 OR KFRJAN95 = -1) THEN KFRJAN95 = .;
   IF (KFSJAN95 = -8 OR KFSJAN95 = -7 OR KFSJAN95 = -1) THEN KFSJAN95 = .;
   IF (KFYSTOP = -9 OR KFYSTOP = -8 OR KFYSTOP = -1) THEN KFYSTOP = .;
   IF (KFYLFTA = -8 OR KFYLFTA = -7 OR KFYLFTA = -1) THEN KFYLFTA = .;
   IF (KFYLFTB = -1) THEN KFYLFTB = .;
   IF (KFYLFTC = -1) THEN KFYLFTC = .;
   IF (KFYCUTA = -8 OR KFYCUTA = -7 OR KFYCUTA = -1) THEN KFYCUTA = .;
   IF (KFYCUTB = -1) THEN KFYCUTB = .;
   IF (KFYCUTC = -1) THEN KFYCUTC = .;
   IF (KFNOW = -9 OR KFNOW = -8 OR KFNOW = -1) THEN KFNOW = .;
   IF (KFCOND = -8 OR KFCOND = -1) THEN KFCOND = .;
   IF (KFAPP2YR >= -9 AND KFAPP2YR <= -1) THEN KFAPP2YR = .;
   IF (KFLASTM >= -9 AND KFLASTM <= -1) THEN KFLASTM = .;
   IF (KFLASTY >= -9 AND KFLASTY <= -1) THEN KFLASTY = .;
   IF (KWIC = -8 OR KWIC = -7 OR KWIC = -1) THEN KWIC = .;
   IF (KBREAK >= -9 AND KBREAK <= -1) THEN KBREAK = .;
   IF (KLUNCH >= -9 AND KLUNCH <= -1) THEN KLUNCH = .;
   IF (KGETCARE = -8 OR KGETCARE = -7 OR KGETCARE = -1) THEN KGETCARE = .;
   IF (KASKCARE = -8 OR KASKCARE = -7 OR KASKCARE = -1) THEN KASKCARE = .;
   IF (KNOCAREA = -8 OR KNOCAREA = -1) THEN KNOCAREA = .;
   IF (KNOCAREB = -1) THEN KNOCAREB = .;
   IF (KNOCAREC = -1) THEN KNOCAREC = .;
   IF (KEITCHRD = -8 OR KEITCHRD = -7) THEN KEITCHRD = .;
   IF (KEITCREC = -8 OR KEITCREC = -7 OR KEITCREC = -1) THEN KEITCREC = .;
   IF (KEITCYR = -8 OR KEITCYR = -7 OR KEITCYR = -1) THEN KEITCYR = .;
   IF (KTAXFED = -8 OR KTAXFED = -7) THEN KTAXFED = .;
   IF (KTAXHELP = -8 OR KTAXHELP = -7 OR KTAXHELP = -1) THEN KTAXHELP = .;
   IF (KCHDSUP = -8 OR KCHDSUP = -7 OR KCHDSUP = -1) THEN KCHDSUP = .;
   IF (KDISBEN = -8 OR KDISBEN = -7 OR KDISBEN = -1) THEN KDISBEN = .;
   IF (LUNPJB >= -9 AND LUNPJB <= -1) THEN LUNPJB = .;
   IF (LVOUCHR >= -9 AND LVOUCHR <= -1) THEN LVOUCHR = .;
   IF (LJBCLAS = -9 OR LJBCLAS = -8 OR LJBCLAS = -7) THEN LJBCLAS = .;
   IF (LTRAIN >= -9 AND LTRAIN <= -1) THEN LTRAIN = .;
   IF (LHSCLS >= -9 AND LHSCLS <= -1) THEN LHSCLS = .;
   IF (LCREDIT >= -9 AND LCREDIT <= -1) THEN LCREDIT = .;
   IF (MLIVEUN = -1) THEN MLIVEUN = .;
   IF (MINSTATE = -8 OR MINSTATE = -7 OR MINSTATE = -1) THEN MINSTATE = .;
   IF (MFDWORRY >= -9 AND MFDWORRY <= -1) THEN MFDWORRY = .;
   IF (MFDLACK >= -9 AND MFDLACK <= -1) THEN MFDLACK = .;
   IF (MCUTMEAL >= -9 AND MCUTMEAL <= -1) THEN MCUTMEAL = .;
   IF (MCUTOFT = -8 OR MCUTOFT = -1) THEN MCUTOFT = .;
   IF (MPAYRENT = -9 OR MPAYRENT = -8 OR MPAYRENT = -7) THEN MPAYRENT = .;
   IF (MMOVEOUT = -8 OR MMOVEOUT = -1) THEN MMOVEOUT = .;
   IF (MLOAN = -8 OR MLOAN = -7 OR MLOAN = -1) THEN MLOAN = .;
   IF (MEMGFOOD >= -9 AND MEMGFOOD <= -1) THEN MEMGFOOD = .;
   IF (MFOODPLA = -8 OR MFOODPLA = -7 OR MFOODPLA = -1) THEN MFOODPLA = .;
   IF (ITOTFAM >= -9 AND ITOTFAM <= -1) THEN ITOTFAM = .;
   IF (IARRNG = -8 OR IARRNG = -7 OR IARRNG = -1) THEN IARRNG = .;
   IF (UFC1REL = -1) THEN UFC1REL = .;
   IF (UFC2REL = -9 OR UFC2REL = -7 OR UFC2REL = -1) THEN UFC2REL = .;
   IF (UMKA1REL = -7 OR UMKA1REL = -1) THEN UMKA1REL = .;
   IF (UMKA2REL = -9 OR UMKA2REL = -8 OR UMKA2REL = -1) THEN UMKA2REL = .;
   IF (UB1REL >= -9 AND UB1REL <= -1) THEN UB1REL = .;
   IF (UB2REL = -7 OR UB2REL = -1) THEN UB2REL = .;
   IF (USPA1REL = -1) THEN USPA1REL = .;
   IF (USPA2REL = -9 OR USPA2REL = -7 OR USPA2REL = -1) THEN USPA2REL = .;
   IF (USPB1REL = -1) THEN USPB1REL = .;
   IF (USPB2REL = -8 OR USPB2REL = -1) THEN USPB2REL = .;
   IF (UEMREL = -1) THEN UEMREL = .;
   IF (USPEMREL = -1) THEN USPEMREL = .;
*/

* SAS FORMAT STATEMENT;

  FORMAT KASHLP2A kashlp2a. MAINRSLT $mainrsf. TYPEINT $typeint.
         XOWNRENT $xownref. XMEDHMO $xmedhmo. XMEDLST $xmedlst.
         XLISTEN $xlisten. STATE $state. SITE $site.
         UREGION $uregion. XOUTPOK2 $xoutpof. BSATMED bsatmed.
         BCONMED bconmed. BLISTEN blisten. BNOWEL bnowel.
         EMEDHMO emedhmo. EMEDLST emedlst. EMEDPCD emedpcd.
         EMEDREF emedref. FNOMED fnomed. FNODEN fnoden.
         FNODRG fnodrg. FOUTPOK2 foutpokf. JANYPUB janypub.
         JAFDCF jafdcf. JSAFDCF jsafdcf. JGAF jgaf.
         JLUMPSUM jlumpsum. JVOUCHEF jvouchef. JFSTAMPF jfstampf.
         JCHILDF jchildf. JFOSTERF jfosterf. JFRELF jfrelf.
         JUNEMPF junempf. JWCOMVEF jwcomvef. JWCOMP jwcomp.
         JWVETB jwvetb. JSUPSECF jsupsecf. JSOCSECF jsocsecf.
         JPENANNF jpenannf. JINTDIVF jintdivf. JRENTALF jrentalf.
         JOTHINCF jothincf. JAFDCA1 jafdca1f. JSUPKID jsupkid.
         JABPOV jabpov. JAB2POV jab2pov. JAB4POV jab4pov.
         JOWNCAR jowncar. JOTHTYPC jothtypc. KAFDC kafdc.
         KAFDCUNT kafdcunt. KAR1STYR kar1styr. KARGT5YR kargt5yr.
         KARJAN95 karjan9f. KASJAN95 kasjan9f. KASWHY kaswhy.
         KASLEFTA kaslefta. KASLEFTB kasleftb. KASLEFTC kasleftc.
         KASCUTA kascuta. KASCUTB kascutb. KASHLP1A kashlp1a.
         KASHLP1B kashlp1b. KASHLP1C kashlp1c. KASJOBT kasjobt.
         KAREDUCE kareduce. KAREDYA karedya. KAREDYB karedyb.
         KAREDYC karedyc. KAFDCAPP kafdcapp. KAOFFHLP kaoffhlp.
         KAFDCNOW kafdcnow. KALIMIT kalimit. KALONGUN kalongun.
         KALCHKM kalchkm. KAFORA kafora. KAFORB kaforb.
         KALSTOPM kalstopm. KALSTOPY kalstopy. KFEVER kfever.
         KFUNT kfunt. KF1STYR kf1styr. KFGT5YR kfgt5yr.
         KFRJAN95 kfrjan9f. KFSJAN95 kfsjan9f. KFYSTOP kfystop.
         KFYLFTA kfylfta. KFYLFTB kfylftb. KFYLFTC kfylftc.
         KFYCUTA kfycuta. KFYCUTB kfycutb. KFYCUTC kfycutc.
         KFNOW kfnow. KFCOND kfcond. KFAPP2YR kfapp2yr.
         KFLASTM kflastm. KFLASTY kflasty. KWIC kwic.
         KBREAK kbreak. KLUNCH klunch. KGETCARE kgetcare.
         KASKCARE kaskcare. KNOCAREA knocarea. KNOCAREB knocareb.
         KNOCAREC knocarec. KEITCHRD keitchrd. KEITCREC keitcrec.
         KEITCYR keitcyr. KTAXFED ktaxfed. KTAXHELP ktaxhelp.
         KCHDSUP kchdsup. KDISBEN kdisben. LUNPJB lunpjb.
         LVOUCHR lvouchr. LJBCLAS ljbclas. LTRAIN ltrain.
         LHSCLS lhscls. LCREDIT lcredit. MLIVEUN mliveun.
         MINSTATE minstate. MFDWORRY mfdworry. MFDLACK mfdlack.
         MCUTMEAL mcutmeal. MCUTOFT mcutoft. MPAYRENT mpayrent.
         MMOVEOUT mmoveout. MLOAN mloan. MEMGFOOD memgfood.
         MFOODPLA mfoodpla. NRISK nrisk. ITOTFAM itotfam.
         IARRNG iarrng. UFC1REL ufc1rel. UFC2REL ufc2rel.
         UMKA1REL umka1rel. UMKA2REL umka2rel. UB1REL ub1rel.
         UB2REL ub2rel. USPA1REL uspa1rel. USPA2REL uspa2rel.
         USPB1REL uspb1rel. USPB2REL uspb2rel. UEMREL uemrel.
         USPEMREL uspemrel.  ;

RUN ;
