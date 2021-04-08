{:repl
 {:plugins [[cider/cider-nrepl "0.25.9"]]}; https://docs.cider.mx/cider/basics/middleware_setup.html
 :user
 {:dependencies [[antq/antq "RELEASE"][org.clojure/clojure "1.10.0"]]
  :aliases {"outdated" ["run" "-m" "antq.core"]}
  :plugins [[lein-set-version "0.4.1"] [lein-update-dependency "0.1.2"]] }}
