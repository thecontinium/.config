{:repl {
        ; :repl-options { :timeout 120000 :init (clojure.core.server/start-server {:accept 'clojure.core.server/io-prepl :address "localhost" :port 55555 :name "lein"})}
        :plugins [[cider/cider-nrepl "0.22.0"]] ; https://docs.cider.mx/cider/basics/middleware_setup.html
        }
}
