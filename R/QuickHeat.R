#' Simple heatmap for GenePix
#'
#' A heat map for GenePix Arrays
#'
#' @param dataset GenePix data.
#' @param coltype color refelcts labeling, green corresponds to IgG; red corresponds to IgM.
#' @param col choose the column you want to look at.
#' @param block choose the block you want to look at closer.
#' @param ttl specific title.
#'
#' @importFrom gplots heatmap.2
#' @export
#'
QuickHeat <- function(dataset, coltypes = c("darkolivegreen", "darkred"), col, ttl="") {

    x <- dataset
    B <- length(unique(x$Block))
    dl <- list()
    for (b in 1:B) {
        xb <- subset(x, Block==b)
        dm <- matrix(0, nrow=14, ncol=14)
        for (i in 1:length(unique(x$Row))) {
            for (j in 1:length(unique(x$Column))) {
                xbr <- xb[which(xb$Row==i),]
                xbrc <- xbr[which(xbr$Column==j),]
                dm[i,j] <- xbrc[,col]

            }
        }

        dl[[b]] <- dm

    }

    DM.l <- c()
    for (o in seq(B-1, 1, -2)) {
        DM.l <- rbind(DM.l, dl[[o]])
    }

    DM.r <- c()
    for (e in seq(B, 2, -2)) {
        DM.r <- rbind(DM.r, dl[[e]])
    }

    DM <- cbind(DM.l, DM.r)

    my_palette <- colorRampPalette(coltypes)(n = 256)

    heatmap.2(DM, Rowv = NA, Colv = NA,
              main=c(ttl,col),
              col = my_palette,
              dendrogram="none",
              trace="none",
              key=FALSE,
              # lmat=rbind(c(2),c(3),c(1),c(4)),
              lwid = c(.6,4),
              lhei = c(.6,4),

              rowsep=seq(14,98,14),
              colsep=c(14)

    )
}



#' @export
quickHeat <- function(dataset,coltypes = c("darkolivegreen", "darkred"),col,block) {

    x <- dataset
    dm <- matrix(0, nrow=14, ncol=14)
    xb <- subset(x, Block==block)

    for (i in 1:length(unique(x$Row))) {
        for (j in 1:length(unique(x$Column))) {
            xbr <- xb[which(xb$Row==i),]
            xbrc <- xbr[which(xbr$Column==j),]
            dm[i,j] <- xbrc[,col]

        }
    }

    my_palette <- colorRampPalette(coltypes)(n = 256)

    heatmap.2(dm, Rowv = NA, Colv = NA,
              main = paste(col," | Block: ",block),
              col = my_palette,
              dendrogram="none",
              # trace="none",
              key=FALSE,
              # lmat=rbind(c(2),c(3),c(1),c(4)),
              lwid = c(.6,4),
              lhei = c(.6,4)
    )

}

