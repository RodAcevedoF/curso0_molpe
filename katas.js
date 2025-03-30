/**
 * 1. Haz una función llamada "setCapitalUpper" que reciba un string y DEVUELVA el string
 * con la inicial en mayúscula.
 *
 * Ejemplos de uso:
 * setCapitalUpper("hello"); // "Hello"
 * setCapitalUpper("hELLO"); // "Hello"
 * setCapitalUpper("HeLlO"); // "Hello"
 * setCapitalUpper("Hello"); // "Hello"
 */

// Tu respuesta aquí

const setCapitalUpper = (str) =>
  str.charAt(0).toUpperCase().concat(str.slice(1).toLowerCase());

console.log(setCapitalUpper("paPaDopOuLoS"));

/**
 * 2. Haz una función "fizzbuzz" que reciba un número entero y, para cada número desde 1
 * hasta el número recibido MUESTRE POR PANTALLA lo siguiente:
 *  >> "fizz" si ese número es múltiplo de 3
 *  >> "buzz" si ese número es múltiplo de 5
 *  >> "fizzbuzz" si ese número es múltiplo de 3 y de 5 a la vez
 *  >> el mismo número si éste no es múltiplo ni de 3 ni de 5
 *
 * Ejemplo de uso:
 * fizzbuzz(5); // 1 2 "fizz" 4 "buzz"
 */

// Tu respuesta aquí

const fizzBuzz = (num) => {
  for (let i = 1; i <= num; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log("fizzBuzz");
    } else if (i % 3 === 0) {
      console.log("fizz");
    } else if (i % 5 === 0) {
      console.log("buzz");
    } else {
      console.log(i);
    }
  }
};

fizzBuzz(15);

/**
 * Escribe una función "bmc" que reciba dos números enteros, "height" y "weight",
 * calcule el índice de masa corporal y te devuelva alguna de los siguientes strings
 * según el caso:
 *
 *  >> Si el índice es menor o igual que 18.5, devuelve "underweight"
 *  >> Si es menor o igual que 25, devuelve "normal"
 *  >> Si es menor o igual que 30, "overweight"
 *  >> Si es mayor de 30, "obese"
 *
 * Ejemplo de uso:
 * bmc(186, 90); "overweight"
 */

// Tu respuesta aquí

const bmc = (h, w) => {
  const idx = (w / ((h / 100) * (h / 100))).toFixed(2);
  if (idx <= 18.5) {
    return "underweight";
  } else if (idx <= 25) {
    return "normal";
  } else if (idx <= 30) {
    return "overweight";
  } else {
    return "obese";
  }
};
console.log(bmc(183, 95));
console.log(bmc(186, 64));
/**
 * Creconst bmc = (h, w) => {
  const idx = w / (h * h);  // Suponiendo que la fórmula de BMI es: peso / altura^2
  if (idx <= 18.5) {
    return "underweight";
  } else if (idx <= 25) {
    return "normal";
  } else if (idx <= 30) {
    return "overweight";
  } else {
    return "obese";
  }
};
a una función "max" que reciba 4 números enteros y devuelva el valor
 * del mayor de ellos. NO SE PUEDE USAR Math.max
 *
 * Ejemplo de uso
 * max(10, 15, 100, 40); // 100
 */

// Tu respuesta aquí

const max = (...nums) =>
  nums.reduce((prev, curr) => (prev > curr ? prev : curr));

console.log(max(21, 14, 5, 8, 75, 90, 17));
