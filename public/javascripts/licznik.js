var licznik = {
  czas : { poczatek : 30, do_konca: 30 },
  alarm : function() {
    alert('Do końca zostało' + czas.do_konca);
  }
};



// jQuery dodaje do list dodatkowo li:first, li:last - to nie są standardowe selektory css
var czas = { poczatek : 30, do_konca : 30 };
var roznicaSekund = function(poczatek, koniec) {
  return (koniec.getTime() - poczatek.getTime()) / 1000;
}

var wstawCzas = function(czas_do_wstawienia) {
  $('#timer').text(czas_do_wstawienia); 
}

// czas_do_odliczenia w minutach
var stoper = function(czas_do_odliczenia) {
  var odliczanie = 0;
  start = new Date().getTime();
  koniec = start.getTime() + czas_do_odliczenia * 60 * 1000;
  while (biezacyCzas < koniec) {
    odliczanie = setInterval(wstawCzas(czas_do_wstawienia), 1000);
  }
}

jQuery(function() {
  $('input[type="text"]:first').focus();  

});
