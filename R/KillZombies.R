#' Remove zombie process.
#' 
#' KillZombies
#' @description Kill zombie process after parallel work.
#' @examples
#' KillZombies()

KillZombies <- function(){
        includes <- '#include <sys/wait.h>'
        code <- 'int wstat; while (waitpid(-1, &wstat, WNOHANG) > 0) {};'
        wait <- inline::cfunction(
            body = code,
            includes = includes,
            convention='.C'
        )
        invisible(wait())
}
