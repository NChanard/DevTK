x <- 1:10
attribute.lst <- list(dim=c(2,5))
x <- AddAttr(x,attribute.lst)
x
attribute.lst <- list(dim=c(5,2))
x <- AddAttr(x,attribute.lst)
x <- AddAttr(x,attribute.lst,overwrite.bln=TRUE)

CheckFilePath(path.pth="my/path/to/my/file.txt")
CheckFilePath(path.pth=NULL,fileName.chr="file", format.chr="txt")

filePath.pth <- "my/path/to/my/file.txt"
GetFileExtension(path.pth=filePath.pth)

GetFileName(path.pth=filePath.pth, ext.bln=FALSE)
GetFileName(path.pth=filePath.pth, ext.bln=TRUE)

GetHelper(
    function(x,y,z, help.bln=F){
    # Helper
        #Na. my_fun
        #De. A function that do the mean
        #Us. my_fun(x,y,z)
        #Ar. x (numeric, integer)
        #Ar. y (numeric, integer)
        #Ar. z (numeric, integer)
        #Va. the mean of x, y and z
        #Ex. my_fun(1,3,5)
        if(help.bln){return(cat(GetHelper(sys.call())))}
    # Run
     return(mean(c(x,y,z)))
}
)
 
file.create("test.file", showWarnings = TRUE)
IsPath("test.file")
IsPath("test.file2")
unlink("test.file")
 
NotIn("A", c("A","B","C"))
NotIn("A", c("B","C","D"))
 
start.tim <- Sys.time()
for(i in seq_len(10000)){
 ShowLoading(start.tim, i , 10000)
}


start.tim <- Sys.time()
for(i in seq_len(10000)){
    Sys.sleep(3)
    ShowLoading(start.tim, i , 10000)
    if (i==3){
        break
    }
}

Versioning()