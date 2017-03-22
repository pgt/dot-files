{:user {:plugins
        [[venantius/ultra "0.5.1"] ;; Better console with colors
        [lein-pprint "1.1.2"]]

        :dependencies
        [[pjstadig/humane-test-output "0.8.1"]] ;; Humane test output for clojure.test

        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}}
