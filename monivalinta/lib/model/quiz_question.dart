class QuizQuestion{
  //construktori joka ottaa vastaa datan
  const QuizQuestion(this.text, this.answers);


//kaksi luokkamuuttujaa
final String text;
final List<String> answers;

List<String> getShuffledAnswers(){ //tässä funktio joka kopioi listan vastauksia(answers) sekoitettuna
final shuffeledList = List.of(answers);  //ensin luodaan muuttuja johon vastaukset tulee
shuffeledList.shuffle();  //sekoitetaan vastauksia ettei aina tule samassa järjestyksessä
return shuffeledList;  //palautetaan sekoitettu kopio lista

}

}