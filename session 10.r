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
