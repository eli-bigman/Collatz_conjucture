class Collatz{
  rng: number;

  constructor(range: number){
    this.rng = range;
  }

  collatz(): number{
    let num: number = this.rng;
    while (num!=1) {
      if (num%2 == 0){
        num /=2;
        console.log(num);
      }else {
        num = (3*num)+1;
        console.log(num);
      }
    }
    return 0;
  }
}

let m = new Collatz(95);
m.collatz();
