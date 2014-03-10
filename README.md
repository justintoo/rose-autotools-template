```
         _    _ _______ ____ _______ ____   ____  _       _____
    /\  | |  | |__   __/ __ \__   __/ __ \ / __ \| |     / ____|
   /  \ | |  | |  | | | |  | | | | | |  | | |  | | |    | (___
  / /\ \| |  | |  | | | |  | | | | | |  | | |  | | |     \___ \
 / ____ \ |__| |  | | | |__| | | | | |__| | |__| | |____ ____) |
/_/    \_\____/   |_|  \____/  |_|  \____/ \____/|______|_____/


 _______ ______ __  __ _____  _            _______ ______
|__   __|  ____|  \/  |  __ \| |        /\|__   __|  ____|
   | |  | |__  | \  / | |__) | |       /  \  | |  | |__
   | |  |  __| | |\/| |  ___/| |      / /\ \ | |  |  __|
   | |  | |____| |  | | |    | |____ / ____ \| |  | |____
   |_|  |______|_|  |_|_|    |______/_/    \_\_|  |______|
```


Build
-----

Perform the Autotools bootstrapping:

    $ ./bootstrap.sh

Then, run the Autoconf configuration:

    $ ./configure --prefix=</path/for/your/installation>

Next, proceed to compile the application with Automake:

    $ make <-j# for # cores of parallelism>

Note: Verbose mode can be turned on with `V=1`:

    $ make V=1

Run the tests with Automake:

    $ make check

