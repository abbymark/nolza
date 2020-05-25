bookScraper = function(){
  
  library(Rserve)
#  Rserve()
#  Rserve(FALSE,port=6311,args='--RS-encoding utf8 --no-save --slave --encoding utf8  --internet2')
  
#  Rserve(args="--RS-encoding utf8")
  
#  Rserve(FALSE,port=6311,args='--RS-encoding utf8 --#-save --slave --encoding utf8')
  
  library(rvest)
  
  
  
  result <-c("랭크",1,2,3,4,5,6,7,8,9,10)
  url <- c("https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EA%B5%90%EB%B3%B4%EB%AC%B8%EA%B3%A0","https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EC%98%88%EC%8A%A424","https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EC%95%8C%EB%9D%BC%EB%94%98","https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EC%9D%B8%ED%84%B0%ED%8C%8C%ED%81%AC%EB%8F%84%EC%84%9C","https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EB%B0%98%EB%94%94%EC%95%A4%EB%A3%A8%EB%8B%88%EC%8A%A4","https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EC%98%81%ED%92%8D%EB%AC%B8%EA%B3%A0","https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=%EB%B2%A0%EC%8A%A4%ED%8A%B8%EC%85%80%EB%9F%AC%20%EB%8F%84%EC%84%9C11%EB%B2%88%EA%B0%80")
  sites <- c("교보문고","예스24","알라딘","인터파크도서","반디앤루니스","영풍문고","도서11번가")
  
  for(page in 1:7){
    bookTitles <- c()
    source <- read_html(url[page])
    
    selector <-paste("#main_pack > div.content_search.section > div > div.contents03_sub > div dl > dt > a", sep='')
      

      
    tags <- html_nodes(source, selector)
    
    data <- html_text(tags, trim = T)
    
    
    
    bookTitles <- c(bookTitles,sites[page])
    bookTitles <- c(bookTitles,data)
    
    result <- data.frame(result,bookTitles, stringsAsFactors = F)
  }
  

  print(result)
  
  
  library(gridExtra)
  names(result) <- NULL
  
  names(result) <- as.data.frame(result[1,])
  result <- result[-1,]
  
  rownames(result) <- NULL
  
  result$랭크<-NULL
  
  png("C:\\__sts\\sts_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\nolza\\resources\\imgs\\test.png", height=30*nrow(result), width=250*ncol(result))
  grid.table(result)
  dev.off()
  
}

#bookScraper()



#ggplot(data=result$bookTitles, aes(x=result))+geom_bar()



#View(result)
#str(bookTitles)

#install.packages("gridExtra")
#library(gridExtra)
#names(result) <- NULL

#names(result) <- as.data.frame(result[1,])
#result <- result[-1,]

#rownames(result) <- NULL

#result$랭크<-NULL

#png("test.png", height=50*nrow(result), width=220*ncol(result))
#grid.table(result)
#dev.off()

