library(stringr)

#1.
print(""")   #wrong result
print("\"")  #\ is escape character, means skip reading the next symbol
cat("\"")  #cat is like printing; 
cat("DSO\n545")  #n stands for new line
cat("DSO\t545")  #t stands for tab

#2.
cat(":-\\") #r expect \ to be a skape character, \\ the second one was printed out

cat("(^_^\")")

cat("@_'-'")

cat("\\m/")

#3.
?str_locate
?str_sub

#4.
str_locate(string = "great",pattern = "a")  #locate "a" in great
str_locate("fantastic","a")
str_locate_all("fantastic","a")
str_locate("super","a")

str_locate(c("fantastic","great","super"),pattern="a")

#5.
str_sub("testing",start = 1L,end=3L)
str_sub("testing",start = 4L,end=7L)
str_sub("testing",end=4L)

?str_extract

#6.
input=c("abc","defg")
str_sub(input,c(2,3))

#7.
#download email.rds, put it in the project folder
emails=readRDS("email.rds")
emails[1]   #there will be lots of \n
cat(emails[1])  #allows to directly read the content
cat(emails[2])  #contains phone numbers and would like to abstract them

str_locate(emails[1],pattern = "\n\n")

#8. extract the header and body of the first email
header=str_sub(emails[1],
            start=1,
            end=842)
cat(header)

body=str_sub(emails[1],start = 843)
cat(body)

#10.extract the bodies and headers of all emails
breaks=str_locate(emails,pattern = "\n\n")
header=str_sub(emails[1:200],start=1,end=breaks[,1])
bodies=str_sub(emails,start=breaks[,2])
cat(bodies[3])


###second lab
#1.
fruit=c("apple","banana","pear","pinapple")

#2. detects if the pattern is found
str_detect(fruit,"a")

str_detect(fruit,"^a") #whether starts with certain pattern - "a"

str_detect(fruit,"a$") #whether ends with certain pattern-"a"

str_detect(fruit,"[aeiou]") #check whether it has a or e or i or o or u

str_detect(fruit,"[a-d]") 

str_detect(fruit,"[0-9]")

str_detect(fruit, "^a[a-z]*e$") #* set the length to be unlimited, but middle can only be characters 
str_detect(fruit,"^a.e$")  #. mean could be any character or number

#4.

phone=c("213 740 4826","213-740-4826","(213) 740 4826")
str_detect(phone,"[0-9]{3} [0-9]{3} [0-9]{4}") #{3} means repeat three times
str_detect(phone,"[0-9]{3}[- ][0-9]{3}[- ][0-9]{4}") #the middle can either be space or dash
str_detect(phone,"[(]?[0-9]{3}[)]?[- ][0-9]{3}[- ][0-9]{4}") #[(]? means ( can be there or not

#5.
str_extract_all(bodies,"[(]?[0-9]{3}[)]?[- ][0-9]{3}[- ][0-9]{4}")  #extract phone numbers from all emails
