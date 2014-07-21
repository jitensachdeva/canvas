/**
 * Created by jitendrasachdeva on 18/07/14.
 */

function getPrimeFinder() {


    var cache = {};

    function isPrime(n) {
        if (n < 2) return false;

        var q = (int)
        Math.sqrt(n);

        for (var i = 2; i <= q; i++) {
            if (n % i == 0) {
                return false;
            }
        }

        return true;
    }

    function checkPrime() {
        if (typeof cache[n] !== undefined) {
            console.log("from cache");
            return cache[n]
        }

        cache[n] = isPrime(n);
        console.log("just processed");
        return cache[n];
    }

    return checkPrime;
}