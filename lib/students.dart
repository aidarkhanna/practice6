class Student {
  const Student({required this.name, required this.group, required this.email});
  final String name;
  final String group;
  final String email;

  Student copyWith({String? name, String? group, String? email}) =>
      Student(
        name: name ?? this.name,
        group: group ?? this.group,
        email: email ?? this.email,
      );
}

List<Student> students = [
  const Student(name: 'Aida Akhmetova', group: 'IT-2302', email: 'aida@kbtu.kz'),
  const Student(name: 'Dias Nurlanov', group: 'IT-2302', email: 'dias@kbtu.kz'),
  const Student(name: 'Madina Serik', group: 'IT-2303', email: 'madina@kbtu.kz'),
  const Student(name: 'Alikhan Bekov', group: 'IT-2303', email: 'alikhan@kbtu.kz'),
  const Student(name: 'Zhanel Tolegen', group: 'IT-2304', email: 'zhanel@kbtu.kz'),
  const Student(name: 'Arman Kairat', group: 'IT-2304', email: 'arman@kbtu.kz'),
  const Student(name: 'Kamila Dosym', group: 'IT-2305', email: 'kamila@kbtu.kz'),
  const Student(name: 'Yerlan Sadyk', group: 'IT-2305', email: 'yerlan@kbtu.kz'),
];