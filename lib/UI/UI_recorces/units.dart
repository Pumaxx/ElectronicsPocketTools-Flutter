class Units {
  Units();

  final String lenght = 'm';
  final String frequency = 'Hz';
  final String energy = 'eV';
  final String speed = 'm/s';
  final String time = 's';
  final String resistance = 'Ω';

  final List<String> lenghtUnits = [
    'nm',
    'μm',
    'mm',
    'cm',
    'm',
    'km',
  ];
  final List<String> frequencyUnits = [
    'nHz',
    'μHz',
    'mHz',
    'Hz',
    'kHz',
    'MHz',
    'GHz',
    'THz',
  ];
  final List<String> energyUnits = [
    'neV',
    'μeV',
    'meV',
    'eV',
    'keV',
    'MeV',
  ];
  final List<String> speedUnits = [
    'cm/s',
    'm/s',
    'km/h',
  ];
  final List<String> timeUnits = [
    'ns',
    'μs',
    'ms',
    's',
  ];
  final List<String> resistanceUnits = [
    'Ω',
    'kΩ',
    'MΩ',
    'GΩ',
  ];
}
