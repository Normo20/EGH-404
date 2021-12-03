%%loads the data set into matlab as a table 
T = readtable('n10256989.csv');
%%removes the outliers from the data set using more than three standard deviations from the mean.
B = rmoutliers(T(:,[2 3 4 5 6]),'mean');
writetable(T,'pin.csv')
%finding the min values
min_vals= min(B{:,1:5});
%finding the max values
max_vals = max(B{:,1:5});
%finding the average values
avg_vals= mean(B{:,1:5});
%box and whisker plot for column 3 (rainfall)
figure (1)
L=boxplot(B{:,2});
ylabel('Rainfall (mm)')
xlabel('point locations')
title ('rainfall box and whisker plot')
%box and whisker plot for column 4 (number of people)
figure (2)
M=boxplot(B{:,3});
ylabel('number of people in location')
xlabel('point locations')
title ('people in location box and whisker plot')
%scatter plot to discern correlations between rainfall(column3) and sensor
%value (column 6)
figure (3)
scatter((B{:,2}),(B{:,5}))
ylabel('Sensor value')
xlabel('Rainfall (mm)')
title ('scatter plot of rainfall depending on sensor value')
%histogram of sensor A using 10 equal bins 
figure(4)
histogram((B{:,4}),10)
ylabel('Sensor value')
title ('Histogram of values from sensor A')
%Q.7 Determine the average number of people for all locations then plot top 100
%on a descending line graph
Groups = T(:,{'Var1','Var2','Var3','Var4','Var5','Var6'});
Summary = grpstats(Groups,'Var1',{'mean','min','max'});
LocPeople = Summary(:,[1,4,5,9]);
DesLocPeople = sortrows(LocPeople,4,'descend');
Top100People = DesLocPeople([1:100],4);
Ranking = linspace(1,100,100);
figure(5)
plot(Ranking,Top100People{:,1});
ylabel('Number of people')
xlabel('Rank')
title ('Descending line graph of top 100 average people per place')

%Q.8 Determine the max and min temperatures and plot for the values for the
%locations from 6 as line graphs
Ranking = linspace(1,100,100);
MinTemp = DesLocPeople([1:100],2);
MaxTemp = DesLocPeople([1:100],3);

figure(6)
plot(Ranking,MinTemp{:,1});
ylabel('Min Temp (c)')
xlabel('Rank')
title('Line graph of minimum temeprature for top 100 locations')

figure(7)
plot(Ranking,MaxTemp{:,1});
ylabel('Max Temperature (c)')
xlabel('Rank')
title('Line graph of maximum temperature for top 100 locations')
writetable(Summary,'deez.csv');
%Q.9 is there correlation between rainfall and temperature explain
figure (5)
scatter((B{:,2}),(B{:,1}))
ylabel('Temperature value (c)')
xlabel('Rainfall (mm)')
title ('scatter plot of rainfalls correlation with Temprature')
%the scatter plot above shows that the relationship between rain fall and
%Temprature is a linear one. Meaning that when the Temprature
%increases the value of the rainfall also increases and vice versa.

% Q.10 find out if there is correlation between rainfall and sensor value B explain
figure (6)
scatter((B{:,2}),(B{:,5}))
ylabel('Sensor value')
xlabel('Rainfall (mm)')
title ('scatter plot of rainfalls correlation with sensor value B')
%the scatter plot above shows that the relationship between rain fall and
%sensor value B is a linear one. Meaning that when the sensor value
%increases the value of the rainfall also increases and vice versa.

%Q.11 what is the expected temprature when rainfall is between 15 and 25mm
L = table2array(varfun(@(x)((x>=15) & (x<=25)), B(:,2)));
Temp_Rain = B(L,:);
avg_temp= mean(Temp_Rain{:,1});
%avg temp shows that the expected temprature is 27 degrees


%for assesment 2 
Group = T(:,{'Var1','Var2','Var3','Var4','Var5','Var6'});
Summary = grpstats(Group,'Var1');
LocPeople = Summary(:,[1,4]);
DesLocPeople = sortrows(LocPeople,2,'descend');
Top100People = DesLocPeople([1:100],2);



