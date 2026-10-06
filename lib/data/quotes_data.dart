import '../models/quote.dart';

const List<Quote> initialQuotes = [
  // HOPE
  Quote(
    id: 'hope_001',
    categoryId: 'hope',
    translations: {
      'en': 'Keep going. Your story is not finished.',
      'de': 'Mach weiter. Deine Geschichte ist noch nicht zu Ende.',
      'sw': 'Endelea. Hadithi yako haijaisha.',
    },
  ),
  Quote(
    id: 'hope_002',
    categoryId: 'hope',
    translations: {
      'en': 'For I know the plans I have for you, plans to give you hope and a future.',
      'de': 'Denn ich weiß wohl, was für Gedanken ich über euch habe: Gedanken des Friedens und nicht des Leides, dass ich euch gebe Zukunft und Hoffnung.',
      'sw': 'Maana nayajua mawazo ninayowawazia ninyi, ni mawazo ya amani wala si ya mabaya, kuwapa ninyi tumaini siku zenu za mwisho.',
    },
    author: 'Bible',
    bibleReference: 'Jeremiah 29:11',
    isBibleVerse: true,
  ),

  // FAITH
  Quote(
    id: 'faith_001',
    categoryId: 'faith',
    translations: {
      'en': 'Faith does not make things easy, it makes them possible.',
      'de': 'Glaube macht die Dinge nicht einfach, er macht sie möglich.',
      'sw': 'Imani haifanyi mambo kuwa rahisi, inafanya yawezekane.',
    },
  ),
  
  // STRENGTH
  Quote(
    id: 'strength_001',
    categoryId: 'strength',
    translations: {
      'en': 'Your difficult season does not define your entire life.',
      'de': 'Deine schwierige Phase definiert nicht dein ganzes Leben.',
      'sw': 'Kipindi chako kigumu hakifasiri maisha yako yote.',
    },
  ),
  Quote(
    id: 'strength_002',
    categoryId: 'strength',
    translations: {
      'en': 'Be strong and courageous. Do not be frightened, and do not be dismayed, for the Lord your God is with you wherever you go.',
      'de': 'Sei mutig und stark! Lass dir keine Angst einjagen und lass dich nicht entmutigen; denn der Herr, dein Gott, steht dir bei, wohin du auch gehst.',
      'sw': 'Uwe hodari na moyo wa ushujaa; usiogope wala usifadhaike; kwa kuwa Bwana, Mungu wako, yu pamoja nawe kila uendako.',
    },
    author: 'Bible',
    bibleReference: 'Joshua 1:9',
    isBibleVerse: true,
  ),

  // MOTIVATION
  Quote(
    id: 'mot_001',
    categoryId: 'motivation',
    translations: {
      'en': 'Small progress is still progress.',
      'de': 'Ein kleiner Fortschritt ist immer noch ein Fortschritt.',
      'sw': 'Maendeleo madogo bado ni maendeleo.',
    },
  ),

  // GROWTH
  Quote(
    id: 'growth_001',
    categoryId: 'growth',
    translations: {
      'en': 'You don\'t have to have everything figured out today.',
      'de': 'Du musst heute nicht alles herausgefunden haben.',
      'sw': 'Si lazima uwe na majibu yote leo.',
    },
  ),

  // PEACE
  Quote(
    id: 'peace_001',
    categoryId: 'peace',
    translations: {
      'en': 'Rest if you need to, but don\'t give up.',
      'de': 'Ruhe dich aus, wenn du musst, aber gib nicht auf.',
      'sw': 'Pumzika ukihitaji, lakini usikate tamaa.',
    },
  ),
];