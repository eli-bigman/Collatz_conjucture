var Collatz = /** @class */ (function () {
    function Collatz(range) {
        this.rng = range;
    }
    Collatz.prototype.collatz = function () {
        var num = this.rng;
        while (num != 1) {
            if (num % 2 == 0) {
                num /= 2;
                console.log(num);
            }
            else {
                num = (3 * num) + 1;
                console.log(num);
            }
        }
        return 0;
    };
    return Collatz;
}());
var m = new Collatz(95);
m.collatz();
document.getElementById("name").innerHTML = "name";
