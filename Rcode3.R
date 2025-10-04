Final project

  
library(data.table)
library(tidyverse)
library(dplyr)

data("flights")
View(flights)

data(airlines)
View(airlines)


flights_b <- flights 
flights_b

flights_c <- flights_b %>% 
  filter (dest == "MIA")%>%
  group_by(carrier) %>%

select(carrier, arr_delay)%>%
arrange (arr_delay)
  flights_c
  
  flights_group <- inner_join(airlines, flights_c, by = "carrier")%>% 
    select (-carrier) 
 
  flights_group
    
  ----q2

 
  library(ggplot2)
  ggplot()
  
  
  flights_d <- flights %>% 
    filter (dest == "MIA")%>%
    group_by(carrier) %>%
    select(carrier, dep_delay)%>%
    arrange (dep_delay)
  flights_d
  
  dep_delays <- ggplot(flights_d,aes(x=carrier,y=dep_delay)) +
    geom_boxplot() +
    scale_y_continuous(
      limits = c(0, 2000),            
      breaks = seq(0, 2000, by = 500) 
      
    )
    dep_delays

-----q3

 --------------------------------------- 
Python -2
plt.figure();
plt.hist(aircraft_c.iloc[:,0])
plt.ylabel('Cost', fontsize=12, color='red')
plt.xlabel('Aspect Ratio', fontsize=12, color='red')
plt.show()

plt.figure();
plt.hist(aircraft_c.iloc[:,1])
plt.ylabel('Cost', fontsize=12, color='red')
plt.xlabel('Lift-to-Drag Ratio', fontsize=12, color='red')
plt.show()


plt.figure();
plt.hist(aircraft_c.iloc[:,2])
plt.ylabel('Cost', fontsize=12, color='red')
plt.xlabel('Weight', fontsize=12, color='red')
plt.show()

plt.figure();
plt.hist(aircraft_c.iloc[:,3])
plt.ylabel('Cost', fontsize=12, color='red')
plt.xlabel('Thrust', fontsize=12, color='red')
plt.show() 
  --------------------------------------------------------------- 
Discussion

import rpy2.robjects as ro
import pandas as pd
ro.r('data(mtcars)')
mtcars = ro.r('mtcars') 
mtcars_df = pd.DataFrame(mtcars)
print(mtcars_df.head())

equation = f"Cost = {reg.intercept_:.2f}"

for coef, feature in zip(reg.coef_, X.columns):
  equation += f"Cost + ({reg.coef_:.2f}" * {feature})
print (equation)


training_data, testing_data = train_test_split(aircraft_c, test_size=0.2, random_state=25)

Y = training_data["Cost"] # outcome variable
X = training_data.drop(columns=["Cost"]) # Explanatory Variables
reg =  LinearRegression()
reg.fit(X,Y)
print(reg.fit(X,Y))

print("Intercept:", reg.intercept_)
print("Coefficients:", reg.coef_)
print("R-squared:", reg.score(X_train, Y_train))


Y = testing_data["Cost"] # outcome variable
X = testing_data.drop(columns=["Cost"])  # Explanatory Variables
Y_pred = reg.predict(testing_data.drop(columns=["Cost"])) # predictions

print (Y_pred)

print(testing_data["Cost"])

results_df_cost = pd.DataFrame ({
  "Actual Cost": 
      testing_data["Cost"],
    "Predicted Cost": 
        Y_pred
})

print(results_df_cost)

print(f"Intercept: {reg.intercept_}")
print(f"Coefficients: {reg.coef_}")
print(f"R-squared: {reg.score(X_test, Y_test)}")


print(Y )
print (Y_pred)

print(results_df_cost)

print(reg.coef_)
MIA_flights_dep = my_airlines.set_index("carrier").join (my_flights.set_index("carrier"), how='right') #join two tables

MIA_flights_dep = pd.DataFrame(MIA_flights_dep['carrier', 'dep_delay','name','dest']) # flight delays 

MIA_flight_dep_delays = df_flight_dep_delays[df_flight_dep_delays['dest'== 'MIA']] #flight dep_delay by MIA destination only

df_MIA_flight_dep_delays = pd.DataFrame(MIA_flight_dep_delays)

df_MIA_flight_dep_delays

array_name= np.array('name')
array_dep_delay= np.array('dep_delay')

plt.figure();
plt.boxplot(MIA_flight_dep_delays)
t = plt.xlabel('MIA Airlines', fontsize=14, color='red')
plt.xlabel('Names of carriers')
plt.ylabel('Departure Delay', fontsize=14, color='red')
plt.title('MIA Aircrafts and Departure delay')
plt.grid(True)
plt.show()

df_subset1 = pd.DataFrame(MIA_flight_dep_delays.iloc[:,0:2])

print(df_subset1)
 
df_subset1 = pd.DataFrame(MIA_flight_dep_delays.data)





