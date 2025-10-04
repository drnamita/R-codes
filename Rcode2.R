
1.	   freq.table <- table(VLBWI$sex) 
head(freq.table)
female   male 
   320    330
2.	summary( VLBWI$race)   
Length     Class      Mode 
      671 character character
3.
b<- filter(VLBWI, race=="black",vent==1, sex=="female") 
 head(b, 3)  
# A tibble: 3 × 21
  patnum hospstay lowph pltct race    bwt  gest inout   twn   lol magsulf
   <dbl>    <dbl> <dbl> <dbl> <chr> <dbl> <dbl> <chr> <dbl> <dbl>   <dbl>
1      3       -2  7.06   114 black   620    23 born…     0    NA      NA
2      5        2  6.97    54 black   925    28 born…     0    NA      NA
3     22       70  7.13   229 black  1120    29 born…     0    NA      NA
# … with 10 more variables: meth <dbl>, toc <dbl>, delivery <chr>,
#   apg1 <dbl>, vent <dbl>, pneumo <dbl>, pda <dbl>, cld <dbl>,
#   sex <chr>, dead <dbl>
# ℹ Use `colnames()` to see all variable names
4.
 col1<- mutate(VLBWI, sub1= lowph>7)
tail(col1)
    head(col1)

A tibble: 6 × 22
  patnum hospstay lowph pltct race    bwt  gest inout   twn   lol magsulf
   <dbl>    <dbl> <dbl> <dbl> <chr> <dbl> <dbl> <chr> <dbl> <dbl>   <dbl>
1      1       34 NA      100 white  1250    35 born…     0    NA      NA
2      2        9  7.25   244 white  1370    32 born…     0    NA      NA
3      3       -2  7.06   114 black   620    23 born…     0    NA      NA
4      4       40  7.25   182 black  1480    32 born…     0    NA      NA
5      5        2  6.97    54 black   925    28 born…     0    NA      NA
6      6       62  7.19    NA white   940    28 born…     0    NA      NA
# … with 11 more variables: meth <dbl>, toc <dbl>, delivery <chr>,
#   apg1 <dbl>, vent <dbl>, pneumo <dbl>, pda <dbl>, cld <dbl>,
#   sex <chr>, dead <dbl>, sub1 <lgl>
# ℹ Use `colnames()` to see all variable names


5. newdata<- arrange(col1,delivery, twn)  
 head(newdata)

A tibble: 6 × 22
  patnum hospstay lowph pltct race    bwt  gest inout   twn   lol magsulf
   <dbl>    <dbl> <dbl> <dbl> <chr> <dbl> <dbl> <chr> <dbl> <dbl>   <dbl>
1      1       34 NA      100 white  1250    35 born…     0    NA      NA
2      2        9  7.25   244 white  1370    32 born…     0    NA      NA
3      5        2  6.97    54 black   925    28 born…     0    NA      NA
4      6       62  7.19    NA white   940    28 born…     0    NA      NA
5     10       28  7.16   153 black  1350    34 born…     0    NA      NA
6     14       69  7.42   361 white  1180    28 born…     0    NA      NA
# … with 11 more variables: meth <dbl>, toc <dbl>, delivery <chr>,
#   apg1 <dbl>, vent <dbl>, pneumo <dbl>, pda <dbl>, cld <dbl>,
#   sex <chr>, dead <dbl>, sub1 <lgl>
# ℹ Use `colnames()` to see all variable names
6. str(newdata)    
tibble [671 × 22] (S3: tbl_df/tbl/data.frame)
 $ patnum  : num [1:671] 1 2 5 6 10 14 17 23 29 31 ...
 $ hospstay: num [1:671] 34 9 2 62 28 69 44 85 29 75 ...
 $ lowph   : num [1:671] NA 7.25 6.97 7.19 7.16 ...
 $ pltct   : num [1:671] 100 244 54 NA 153 361 186 68 170 179 ...
 $ race    : chr [1:671] "white" "white" "black" "white" ...
 $ bwt     : num [1:671] 1250 1370 925 940 1350 1180 1490 740 1300 970 ...
 $ gest    : num [1:671] 35 32 28 28 34 28 33 26 31 29 ...
 $ inout   : chr [1:671] "born at duke" "born at duke" "born at duke" "born at duke" ...
 $ twn     : num [1:671] 0 0 0 0 0 0 0 0 0 0 ...
 $ lol     : num [1:671] NA NA NA NA NA NA NA NA NA NA ...
 $ magsulf : num [1:671] NA NA NA NA NA NA NA NA NA NA ...
 $ meth    : num [1:671] 0 1 0 1 1 0 1 0 0 0 ...
 $ toc     : num [1:671] 0 0 0 0 0 0 0 0 0 1 ...
 $ delivery: chr [1:671] "abdominal" "abdominal" "abdominal" "abdominal" ...
 $ apg1    : num [1:671] 8 7 5 8 4 6 8 9 1 1 ...
 $ vent    : num [1:671] 0 0 1 1 0 0 0 0 1 1 ...
 $ pneumo  : num [1:671] 0 0 1 0 0 0 0 0 1 0 ...
 $ pda     : num [1:671] 0 0 0 0 0 0 0 0 0 0 ...
 $ cld     : num [1:671] 0 0 0 0 0 0 0 0 0 1 ...
 $ sex     : chr [1:671] "female" "female" "female" "female" ...
 $ dead    : num [1:671] 0 0 1 0 0 0 0 0 0 0 ...
 $ sub1    : logi [1:671] NA TRUE FALSE TRUE TRUE TRUE ...


7.

    gp <- group_by(VLBWI,race,sex)
mn <- summarise(gp)
head(mn)

> head(mn)
# A tibble: 6 × 2
# Groups:  race [3]
  race                       	 sex   
  <chr>                     	 <chr> 
1 black        	   	female
2 black         	  	male  
3 native american 	female
4 native american 	male  
5 oriental        		female
6 oriental      		  male  
----------------------------------------------------------------------------------
   summary(gp)

summary(gp) 
     patnum         hospstay            lowph           pltct      
 Min.   :  1.0   Min.   :-6574.00   Min.   :6.530   Min.   : 16.0  
 1st Qu.:168.5   1st Qu.:   16.00   1st Qu.:7.130   1st Qu.:143.0  
 Median :336.0   Median :   37.00   Median :7.210   Median :202.0  
 Mean   :336.0   Mean   :   40.36   Mean   :7.202   Mean   :201.6  
 3rd Qu.:503.5   3rd Qu.:   62.00   3rd Qu.:7.310   3rd Qu.:252.0  
 Max.   :671.0   Max.   : 3668.00   Max.   :7.550   Max.   :571.0  
                 NA's   :31         NA's   :62      NA's   :70     
     race                bwt            gest          inout          
 Length:671         Min.   : 400   Min.   :22.00   Length:671        
 Class :character   1st Qu.: 900   1st Qu.:27.00   Class :character  
 Mode  :character   Median :1120   Median :29.00   Mode  :character  
                    Mean   :1094   Mean   :28.87                     
                    3rd Qu.:1310   3rd Qu.:31.00                     
                    Max.   :1580   Max.   :40.00                     
                    NA's   :2      NA's   :4                         
      twn              lol             magsulf            meth       
 Min.   :0.0000   Min.   :  0.000   Min.   :0.0000   Min.   :0.0000  
 1st Qu.:0.0000   1st Qu.:  0.000   1st Qu.:0.0000   1st Qu.:0.0000  
 Median :0.0000   Median :  3.500   Median :0.0000   Median :0.0000  
 Mean   :0.2074   Mean   :  8.438   Mean   :0.1344   Mean   :0.4372  
 3rd Qu.:0.0000   3rd Qu.:  9.000   3rd Qu.:0.0000   3rd Qu.:1.0000  
 Max.   :1.0000   Max.   :192.000   Max.   :1.0000   Max.   :1.0000  
 NA's   :20       NA's   :381       NA's   :247      NA's   :106     
      toc           delivery              apg1            vent       
 Min.   :0.0000   Length:671         Min.   :0.000   Min.   :0.0000  
 1st Qu.:0.0000   Class :character   1st Qu.:2.000   1st Qu.:0.0000  
 Median :0.0000   Mode  :character   Median :5.000   Median :1.0000  
 Mean   :0.2248                      Mean   :4.903   Mean   :0.5803  
 3rd Qu.:0.0000                      3rd Qu.:7.000   3rd Qu.:1.0000  
 Max.   :1.0000                      Max.   :9.000   Max.   :1.0000  
 NA's   :106                         NA's   :34      NA's   :30      
     pneumo            pda              cld             sex           
 Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Length:671        
 1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   Class :character  
 Median :0.0000   Median :0.0000   Median :0.0000   Mode  :character  
 Mean   :0.1969   Mean   :0.2087   Mean   :0.2694                     
 3rd Qu.:0.0000   3rd Qu.:0.0000   3rd Qu.:1.0000                     
 Max.   :1.0000   Max.   :1.0000   Max.   :1.0000                     
 NA's   :26       NA's   :29       NA's   :66                         
      dead       
 Min.   :0.0000  
 1st Qu.:0.0000  
 Median :0.0000  
 Mean   :0.2146  
 3rd Qu.:0.0000  
 Max.   :1.0000  

8. 
g<-VLBWI %>% filter (race=="female") %>% summarise(VLBWI$race) 
head(g)


g<-VLBWI %>% filter (race=="female") %>% summarise(VLBWI$race) 
> head(g)
# A tibble: 6 × 1
  `VLBWI$race`
  <chr>       
1 white       
2 white       
3 black       
4 black       
5 black       
6 white   


9.      
          summ_lowph<-  summary (VLBWI$lowph)    
>   head(summ_lowph)


    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
6.529999 7.129997 7.209999 7.201903 7.309998 7.549999
10.       
b<- select(VLBWI,c(2:20)) 
> head(b)


# A tibble: 6 × 19
  hospstay lowph pltct race    bwt  gest inout     twn   lol magsulf  meth   toc deliv…¹  apg1
     <dbl> <dbl> <dbl> <chr> <dbl> <dbl> <chr>   <dbl> <dbl>   <dbl> <dbl> <dbl> <chr>   <dbl>
1       34 NA      100 white  1250    35 born a…     0    NA      NA     0     0 abdomi…     8
2        9  7.25   244 white  1370    32 born a…     0    NA      NA     1     0 abdomi…     7
3       -2  7.06   114 black   620    23 born a…     0    NA      NA     0     1 vaginal     1
4       40  7.25   182 black  1480    32 born a…     0    NA      NA     1     0 vaginal     8
5        2  6.97    54 black   925    28 born a…     0    NA      NA     0     0 abdomi…     5
6       62  7.19    NA white   940    28 born a…     0    NA      NA     1     0 abdomi…     8
# … with 5 more variables: vent <dbl>, pneumo <dbl>, pda <dbl>, cld <dbl>, sex <chr>, and
#   abbreviated variable name ¹delivery
# ℹ Use `colnames()` to see all variable names

--------------------------------------------------------------------------------------------------------------------
11. b<- select(VLBWI,c(2:5)) 
> head(b)
# A tibble: 6 × 4
  hospstay lowph pltct race 
     <dbl> <dbl> <dbl> <chr>
1       34 NA      100 white
2        9  7.25   244 white
3       -2  7.06   114 black
4       40  7.25   182 black
5        2  6.97    54 black
6       62  7.19    NA white
12
arrang1 <- arrange(VLBWI, desc(lowph), race)
> head(arrang1)
# A tibble: 6 × 21
  patnum hospstay lowph pltct race     bwt  gest inout   twn   lol magsulf  meth   toc deliv…¹
   <dbl>    <dbl> <dbl> <dbl> <chr>  <dbl> <dbl> <chr> <dbl> <dbl>   <dbl> <dbl> <dbl> <chr>  
1    529       59  7.55   247 white   1480    34 born…     1    10       0     1     0 vaginal
2    530       31  7.52   272 white   1200    34 born…     1    10       0     1     0 vaginal
3    476       14  7.5    250 nativ…  1220    32 born…     0    10       0     1     0 vaginal
4    320       12  7.49   278 black   1500    34 born…     0     4      NA     0     0 vaginal
5    453       12  7.49   332 black   1400    33 born…     0     8       0     1     0 vaginal
6    264       32  7.48   356 black   1290    30 born…     0    NA       0     1     0 vaginal
# … with 7 more variables: apg1 <dbl>, vent <dbl>, pneumo <dbl>, pda <dbl>, cld <dbl>,
#   sex <chr>, dead <dbl>, and abbreviated variable name ¹delivery
# ℹ Use `colnames()` to see all variable names

------------------------------------------------------------------------------------------------------------------------------
13.

> a1<- select(VLBWI, lowph, race)
> arrang1 <- arrange(a1, desc(lowph), race)
> head(arrang1)
# A tibble: 6 × 2
  lowph race           
  <dbl> <chr>          
1  7.55 white          
2  7.52 white          
3  7.5  native american
4  7.49 black          
5  7.49 black          
6  7.48 black
---------------------------------------------------------------------------------------------------------------------------

14. 
arrang1 <- arrange(a1, desc(lowph), race)
> head(arrang1)
# A tibble: 6 × 2
  lowph race           
  <dbl> <chr>          
1  7.55 white          
2  7.52 white          
3  7.5  native american
4  7.49 black          
5  7.49 black          
6  7.48 black       

   
15. 
> arrang1 <- arrange(a1, desc(lowph), race=="white")
> head(arrang1)
# A tibble: 6 × 2
  lowph race           
  <dbl> <chr>          
1  7.55 white          
2  7.52 white          
3  7.5  native american
4  7.49 black          
5  7.49 black          
6  7.48 black          


16. 
> arrang1 <- arrange(a1, desc(lowph) & race=="white")
> head(arrang1)
# A tibble: 6 × 2
  lowph race 
  <dbl> <chr>
1  7.06 black
2  7.25 black
3  6.97 black
4  7.32 black
5  7.16 black
6  7.18 black


17.
 > arrang1 <- arrange(a1, desc(lowph) & !race=="white")
> head(arrang1)
# A tibble: 6 × 2
  lowph race 
  <dbl> <chr>
1 NA    white
2  7.25 white
3  7.19 white
4  7.04 white
5  7.42 white
6  7.12 white

18. 
select(VLBWI, race, lowph, pltct)

# A tibble: 671 × 3
   race  lowph pltct
   <chr> <dbl> <dbl>
 1 white NA      100
 2 white  7.25   244
 3 black  7.06   114
 4 black  7.25   182
 5 black  6.97    54
 6 white  7.19    NA
 7 black  7.32   282
 8 NA    NA       NA
 9 NA    NA       NA
10 black  7.16   153
# … with 661 more rows
# ℹ Use `print(n = ...)` to see more rows
19.


select(VLBWI, race:lowph)
# A tibble: 671 × 3
   race  		pltct 		lowph
   <chr> 		<dbl>		 <dbl>
 1 white   	100 		NA   
 2 white  	 244  		7.25
 3 black   	114  		7.06
 4 black   	182 		 7.25
 5 black   	 54  		6.97
 6 white   	 NA 		 7.19
 7 black   	282  		7.32
 8 NA       	NA 		NA   
 9 NA       	NA		 NA   
10 black   	153  		7.16
# … with 661 more rows
# ℹ Use `print(n = ...)` to see more rows
20 

select(VLBWI, -race, lowph, pltct)


# A tibble: 671 × 20
   patnum hospstay lowph pltct   bwt  gest inout   twn   lol magsulf  meth   toc deliv…¹  apg1
    <dbl>    <dbl> <dbl> <dbl> <dbl> <dbl> <chr> <dbl> <dbl>   <dbl> <dbl> <dbl> <chr>   <dbl>
 1      1       34 NA      100  1250  35   born…     0    NA      NA     0     0 abdomi…     8
 2      2        9  7.25   244  1370  32   born…     0    NA      NA     1     0 abdomi…     7
 3      3       -2  7.06   114   620  23   born…     0    NA      NA     0     1 vaginal     1
 4      4       40  7.25   182  1480  32   born…     0    NA      NA     1     0 vaginal     8
 5      5        2  6.97    54   925  28   born…     0    NA      NA     0     0 abdomi…     5
 6      6       62  7.19    NA   940  28   born…     0    NA      NA     1     0 abdomi…     8
 7      7       32  7.32   282  1255  29.5 born…     0    NA      NA     1     0 vaginal     9
 8      8       NA NA       NA   600  26   born…    NA    NA      NA    NA    NA NA         NA
 9      9       NA NA       NA   700  24   born…    NA    NA      NA    NA    NA NA         NA
10     10       28  7.16   153  1350  34   born…     0    NA      NA     1     0 abdomi…     4
# … with 661 more rows, 6 more variables: vent <dbl>, pneumo <dbl>, pda <dbl>, cld <dbl>,
#   sex <chr>, dead <dbl>, and abbreviated variable name ¹delivery
# ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names

---------------------------------------------------------------------------------------------
21.

    Neg<- select(VLBWI, -race, lowph, pltct)
> dim(Neg)

[1] 671  20


> str(VLBWI)
tibble [671 × 21] (S3: tbl_df/tbl/data.frame)
 $ patnum  : num [1:671] 1 2 3 4 5 6 7 8 9 10 ...
 $ hospstay: num [1:671] 34 9 -2 40 2 62 32 NA NA 28 ...
 $ lowph   : num [1:671] NA 7.25 7.06 7.25 6.97 ...
 $ pltct   : num [1:671] 100 244 114 182 54 NA 282 NA NA 153 ...
 $ race    : chr [1:671] "white" "white" "black" "black" ...
 $ bwt     : num [1:671] 1250 1370 620 1480 925 ...
 $ gest    : num [1:671] 35 32 23 32 28 28 29.5 26 24 34 ...
 $ inout   : chr [1:671] "born at duke" "born at duke" "born at duke" "born at duke" ...
 $ twn     : num [1:671] 0 0 0 0 0 0 0 NA NA 0 ...
 $ lol     : num [1:671] NA NA NA NA NA NA NA NA NA NA ...
 $ magsulf : num [1:671] NA NA NA NA NA NA NA NA NA NA ...
 $ meth    : num [1:671] 0 1 0 1 0 1 1 NA NA 1 ...
 $ toc     : num [1:671] 0 0 1 0 0 0 0 NA NA 0 ...
 $ delivery: chr [1:671] "abdominal" "abdominal" "vaginal" "vaginal" ...
 $ apg1    : num [1:671] 8 7 1 8 5 8 9 NA NA 4 ...
 $ vent    : num [1:671] 0 0 1 0 1 1 0 NA NA 0 ...
 $ pneumo  : num [1:671] 0 0 0 0 1 0 0 NA NA 0 ...
 $ pda     : num [1:671] 0 0 0 0 0 0 0 NA NA 0 ...
 $ cld     : num [1:671] 0 0 NA 0 0 0 0 NA NA 0 ...
 $ sex     : chr [1:671] "female" "female" "female" "male" ...
 $ dead    : num [1:671] 0 0 1 0 1 0 0 1 1 0 ...
22. select(select_sex, 1:4)
# A tibble: 320 × 4
   patnum hospstay lowph pltct
    <dbl>    <dbl> <dbl> <dbl>
 1      1       34 NA      100
 2      2        9  7.25   244
 3      3       -2  7.06   114
 4      5        2  6.97    54
 5      6       62  7.19    NA
 6      7       32  7.32   282
 7     10       28  7.16   153
 8     15        1  7.12   378
 9     18       50  7.27    NA
10     21       44  7.29   134
# … with 310 more rows
# ℹ Use `print(n = ...)` to see more rows
------------------------------------------------------------------------------------------------------------

> select(select_sex, 1:14)

# A tibble: 320 × 14
   patnum hospstay lowph pltct race    bwt  gest inout   twn   lol magsulf  meth   toc deliv…¹
    <dbl>    <dbl> <dbl> <dbl> <chr> <dbl> <dbl> <chr> <dbl> <dbl>   <dbl> <dbl> <dbl> <chr>  
 1      1       34 NA      100 white  1250  35   born…     0    NA      NA     0     0 abdomi…
 2      2        9  7.25   244 white  1370  32   born…     0    NA      NA     1     0 abdomi…
 3      3       -2  7.06   114 black   620  23   born…     0    NA      NA     0     1 vaginal
 4      5        2  6.97    54 black   925  28   born…     0    NA      NA     0     0 abdomi…
 5      6       62  7.19    NA white   940  28   born…     0    NA      NA     1     0 abdomi…
 6      7       32  7.32   282 black  1255  29.5 born…     0    NA      NA     1     0 vaginal
 7     10       28  7.16   153 black  1350  34   born…     0    NA      NA     1     0 abdomi…
 8     15        1  7.12   378 white   970  28   born…     0    NA      NA     1     1 vaginal
 9     18       50  7.27    NA black  1170  31   born…     1    NA      NA     1     0 vaginal
10     21       44  7.29   134 white  1000  28   born…     0    NA      NA     0     0 vaginal
# … with 310 more rows, and abbreviated variable name ¹delivery
# ℹ Use `print(n = ...)` to see more rows

23.
FL <- VLBWI %>% 
+ select(race, sex) %>% 
+ filter(race=="white", sex == "female")
> table(FL)
       sex
race    female
  white    133
--------------------------------------------------------------------------------------------

    

