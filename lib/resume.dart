import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Resume {
  // Class replicates jsonresume-based schema and offers constructor and json serialization
  String resumeId; // id of resume
  String resumeName; // name of resume

  String name = '';
  String label = '';
  String picture = '';
  String email = '';
  String phone = '';
  String website = '';
  String summary = '';
  String location = '';
  List<Profile> profiles = [];
  List<Work> work = [];
  List<Volunteer> volunteer = [];
  List<Education> education = [];
  List<Skill> skills = [];
  List<Language> languages = [];
  List<Interest> interests = [];
  List<Reference> references = [];

  Resume({String? resumeId, String resumeName = ''})
      : resumeId = resumeId ?? const Uuid().v4(),
        resumeName = resumeName.isEmpty ? 'New resume' : resumeName;

  factory Resume.fromJson(Map<String, dynamic> json) {
    final List<Profile> profiles = (json['basics']['profiles'] as List)
        .map((e) => Profile.fromJson(e))
        .toList();
    final List<Work> work =
        (json['work'] as List).map((e) => Work.fromJson(e)).toList();
    final List<Volunteer> volunteer =
        (json['volunteer'] as List).map((e) => Volunteer.fromJson(e)).toList();
    final List<Education> education =
        (json['education'] as List).map((e) => Education.fromJson(e)).toList();
    final List<Skill> skills =
        (json['skills'] as List).map((e) => Skill.fromJson(e)).toList();
    final List<Language> languages =
        (json['languages'] as List).map((e) => Language.fromJson(e)).toList();
    final List<Interest> interests =
        (json['interests'] as List).map((e) => Interest.fromJson(e)).toList();
    final List<Reference> references =
        (json['references'] as List).map((e) => Reference.fromJson(e)).toList();

    return Resume(
        resumeId: json['meta']['id'], resumeName: json['meta']['name'])
      ..name = json['basics']['name']
      ..label = json['basics']['label']
      ..picture = json['basics']['picture']
      ..email = json['basics']['email']
      ..phone = json['basics']['phone']
      ..website = json['basics']['url']
      ..summary = json['basics']['summary']
      ..location = json['basics']['location']
      ..profiles = profiles
      ..work = work
      ..volunteer = volunteer
      ..education = education
      ..skills = skills
      ..languages = languages
      ..interests = interests
      ..references = references;
  }

  Map<String, dynamic> toJson() => {
        'resumeId': resumeId,
        'resumeName': resumeName,
        'basics': {
          'name': name,
          'label': label,
          'picture': picture,
          'email': email,
          'phone': phone,
          'website': website,
          'summary': summary,
          'location': location
        },
        'work': work,
        'education': education,
        'skills': skills,
        'languages': languages,
        'interests': interests,
        'references': references
      };
}

class Profile {
  String network = '';
  String username = '';
  String url = '';

  Profile(this.network, this.username, this.url);

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(json['network'], json['username'], json['url']);
  }

  Map<String, dynamic> toJson() =>
      {'network': network, 'username': username, 'url': url};
}

class Work {
  String company;
  String position;
  String website = '';
  String startDate = '';
  String endDate = '';
  String summary = '';
  List<String> highlights = [];

  Work(this.company, this.position);

  factory Work.fromJson(Map<String, dynamic> json) {
    final List<String> highlights =
        (json['highlights'] as List).map((e) => e.toString()).toList();

    return Work(json['company'], json['position'])
      ..website = json['website']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..summary = json['summary']
      ..highlights = highlights;
  }

  Map<String, dynamic> toJson() => {
        'company': company,
        'position': position,
        'website': website,
        'startDate': startDate,
        'endDate': endDate,
        'summary': summary,
        'highlights': highlights
      };
}

class Volunteer {
  String organization;
  String position;
  String website = '';
  String startDate = '';
  String endDate = '';
  String summary = '';
  List<String> highlights = [];

  Volunteer(this.organization, this.position);

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    final List<String> highlights =
        (json['highlights'] as List).map((e) => e.toString()).toList();

    return Volunteer(json['organization'], json['position'])
      ..website = json['website']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..summary = json['summary']
      ..highlights = highlights;
  }

  Map<String, dynamic> toJson() => {
        'organization': organization,
        'position': position,
        'website': website,
        'startDate': startDate,
        'endDate': endDate,
        'summary': summary,
        'highlights': highlights
      };
}

class Education {
  String institution;
  String area;
  String studyType;
  String startDate = '';
  String endDate = '';
  String gpa = '';
  List<String> courses = [];

  Education(this.institution, this.area, this.studyType);

  factory Education.fromJson(Map<String, dynamic> json) {
    final List<String> courses =
        (json['courses'] as List).map((e) => e.toString()).toList();

    return Education(json['institution'], json['area'], json['studyType'])
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..gpa = json['gpa']
      ..courses = courses;
  }

  Map<String, dynamic> toJson() => {
        'institution': institution,
        'area': area,
        'studyType': studyType,
        'startDate': startDate,
        'endDate': endDate,
        'gpa': gpa,
        'courses': courses
      };
}

class Award {
  String title;
  String date = '';
  String awarder = '';
  String summary = '';

  Award(this.title);

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(json['title'])
      ..date = json['date']
      ..awarder = json['awarder']
      ..summary = json['summary'];
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'date': date, 'awarder': awarder, 'summary': summary};
}

class Publication {
  String name;
  String publisher = '';
  String releaseDate = '';
  String website = '';
  String summary = '';

  Publication(this.name);

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(json['name'])
      ..publisher = json['publisher']
      ..releaseDate = json['releaseDate']
      ..website = json['website']
      ..summary = json['summary'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'publisher': publisher,
        'releaseDate': releaseDate,
        'website': website,
        'summary': summary
      };
}

class Skill {
  String name;
  String level = '';
  List<String> keywords = [];

  Skill(this.name);

  factory Skill.fromJson(Map<String, dynamic> json) {
    List<String> keywords =
        (json['keywords'] as List).map((e) => e.toString()).toList();

    return Skill(json['name'])
      ..level = json['level']
      ..keywords = keywords;
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'level': level, 'keywords': keywords};
}

class Language {
  String language;
  String fluency = '';

  Language(this.language);

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(json['language'])..fluency = json['fluency'];
  }

  Map<String, dynamic> toJson() => {'language': language, 'fluency': fluency};
}

class Interest {
  String name;
  List<String> keywords = [];

  Interest(this.name);

  factory Interest.fromJson(Map<String, dynamic> json) {
    List<String> keywords =
        (json['keywords'] as List).map((e) => e.toString()).toList();

    return Interest(json['name'])..keywords = keywords;
  }

  Map<String, dynamic> toJson() => {'name': name, 'keywords': keywords};
}

class Reference {
  String name;
  String reference;

  Reference(this.name, this.reference);

  factory Reference.fromJson(Map<String, dynamic> json) {
    return Reference(json['name'], json['reference']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'reference': reference};
}

class Project {
  String name;
  String description = '';
  String startDate = '';
  String endDate = '';
  String url = '';
  List<String> keywords = [];
  List<String> highlights = [];
  List<String> roles = [];
  String entity = '';
  String type = '';

  Project(this.name);

  factory Project.fromJson(Map<String, dynamic> json) {
    final List<String> keywords =
        (json['keywords'] as List).map((e) => e.toString()).toList();
    final List<String> highlights =
        (json['highlights'] as List).map((e) => e.toString()).toList();
    final List<String> roles =
        (json['roles'] as List).map((e) => e.toString()).toList();

    return Project(json['name'])
      ..description = json['description']
      ..startDate = json['startDate']
      ..endDate = json['endDate']
      ..url = json['url']
      ..keywords = keywords
      ..roles = roles
      ..entity = json['entity']
      ..type = json['type']
      ..highlights = highlights;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
        'url': url,
        'keywords': keywords,
        'roles': roles,
        'entity': entity,
        'type': type,
        'highlights': highlights
      };
}

// Widgets
class ResumeEditor extends StatefulWidget {
  final Resume resume;
  final Function(Resume) onSaved;

  const ResumeEditor({Key? key, required this.resume, required this.onSaved})
      : super(key: key);

  @override
  _ResumeEditorState createState() => _ResumeEditorState();
}

class _ResumeEditorState extends State<ResumeEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: TextEditingController(text: widget.resume.resumeName),
          onChanged: (value) => widget.resume.resumeName = value,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.name),
            onChanged: (value) => widget.resume.name = value,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.label),
            onChanged: (value) => widget.resume.label = value,
            decoration: const InputDecoration(
              labelText: 'Label',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.email),
            onChanged: (value) => widget.resume.email = value,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.phone),
            onChanged: (value) => widget.resume.phone = value,
            decoration: const InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.website),
            onChanged: (value) => widget.resume.website = value,
            decoration: const InputDecoration(
              labelText: 'Website',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.summary),
            onChanged: (value) => widget.resume.summary = value,
            maxLines: 5,
            maxLength: 300,
            decoration: const InputDecoration(
              labelText: 'Summary',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: TextEditingController(text: widget.resume.location),
            onChanged: (value) => widget.resume.location = value,
            decoration: const InputDecoration(
              labelText: 'Location',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),

          // Profiles Box with ListView of Cards and "Add" Button
          // Card click invokes edit dialog
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Profiles'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => ProfileEditor(),
                      );
                      if (result != null) {
                        setState(() {
                          widget.resume.profiles.add(result);
                        });
                      }
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.resume.profiles.length,
                  itemBuilder: (context, index) {
                    final profile = widget.resume.profiles[index];
                    return ListTile(
                      title: Text(profile.network),
                      subtitle: Text(profile.username),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.resume.profiles.removeAt(index);
                          });
                        },
                      ),
                      onTap: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (context) => ProfileEditor(profile: profile),
                        );
                        if (result != null) {
                          setState(() {
                            widget.resume.profiles[index] = result;
                          });
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Work Box with ListView of draggable Cards and "Add" Button
          // Card click invokes edit dialog
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Work'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => WorkEditor(),
                      );
                      if (result != null) {
                        setState(() {
                          widget.resume.work.add(result);
                        });
                      }
                    },
                  ),
                ),
                ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.resume.work.length,
                  itemBuilder: (context, index) {
                    final work = widget.resume.work[index];
                    return ListTile(
                      key: ValueKey(work),
                      title: Text(work.company),
                      subtitle: Text(work.position),
                      //  Edit/Delete menu on leading
                      leading: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text('Edit'),
                            value: 'edit',
                          ),
                          const PopupMenuItem(
                            child: Text('Delete'),
                            value: 'delete',
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'edit') {
                            final result = await showDialog(
                              context: context,
                              builder: (context) => WorkEditor(work: work),
                            );
                            if (result != null) {
                              setState(() {
                                widget.resume.work[index] = result;
                              });
                            }
                          } else if (value == 'delete') {
                            setState(() {
                              widget.resume.work.removeAt(index);
                            });
                          }
                        },
                      ),
                      onTap: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (context) => WorkEditor(work: work),
                        );
                        if (result != null) {
                          setState(() {
                            widget.resume.work[index] = result;
                          });
                        }
                      },
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final work = widget.resume.work.removeAt(oldIndex);
                      widget.resume.work.insert(newIndex, work);
                    });
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Volunteer Box with ListView of draggable Cards and "Add" Button
          // Card click invokes edit dialog
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Volunteer'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => VolunteerEditor(),
                      );
                      if (result != null) {
                        setState(() {
                          widget.resume.volunteer.add(result);
                        });
                      }
                    },
                  ),
                ),
                ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.resume.volunteer.length,
                  itemBuilder: (context, index) {
                    final volunteer = widget.resume.volunteer[index];
                    return ListTile(
                      key: ValueKey(volunteer),
                      title: Text(volunteer.organization),
                      subtitle: Text(volunteer.position),
                      //  Edit/Delete menu on leading
                      leading: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text('Edit'),
                            value: 'edit',
                          ),
                          const PopupMenuItem(
                            child: Text('Delete'),
                            value: 'delete',
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'edit') {
                            final result = await showDialog(
                              context: context,
                              builder: (context) =>
                                  VolunteerEditor(volunteer: volunteer),
                            );
                            if (result != null) {
                              setState(() {
                                widget.resume.volunteer[index] = result;
                              });
                            }
                          } else if (value == 'delete') {
                            setState(() {
                              widget.resume.volunteer.removeAt(index);
                            });
                          }
                        },
                      ),
                      onTap: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (context) =>
                              VolunteerEditor(volunteer: volunteer),
                        );
                        if (result != null) {
                          setState(() {
                            widget.resume.volunteer[index] = result;
                          });
                        }
                      },
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final volunteer =
                          widget.resume.volunteer.removeAt(oldIndex);
                      widget.resume.volunteer.insert(newIndex, volunteer);
                    });
                  },
                )
              ],
            ),
          ),

          // Education Box with ListView of draggable Cards and "Add" Button
          // Card click invokes edit dialog
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Education'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => EducationEditor(),
                      );
                      if (result != null) {
                        setState(() {
                          widget.resume.education.add(result);
                        });
                      }
                    },
                  ),
                ),
                ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.resume.education.length,
                  itemBuilder: (context, index) {
                    final education = widget.resume.education[index];
                    return ListTile(
                      key: ValueKey(education),
                      title: Text(education.institution),
                      subtitle: Text(education.studyType),
                      //  Edit/Delete menu on leading
                      leading: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text('Edit'),
                            value: 'edit',
                          ),
                          const PopupMenuItem(
                            child: Text('Delete'),
                            value: 'delete',
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'edit') {
                            final result = await showDialog(
                              context: context,
                              builder: (context) => EducationEditor(
                                education: education,
                              ),
                            );
                            if (result != null) {
                              setState(() {
                                widget.resume.education[index] = result;
                              });
                            }
                          } else if (value == 'delete') {
                            setState(() {
                              widget.resume.education.removeAt(index);
                            });
                          }
                        },
                      ),
                      onTap: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (context) => EducationEditor(
                            education: education,
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            widget.resume.education[index] = result;
                          });
                        }
                      },
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final education =
                          widget.resume.education.removeAt(oldIndex);
                      widget.resume.education.insert(newIndex, education);
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileEditor extends StatefulWidget {
  final Profile? profile;

  const ProfileEditor({Key? key, this.profile}) : super(key: key);

  @override
  _ProfileEditorState createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile ?? Profile('', '', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: profile.network,
              onChanged: (value) => profile.network = value,
              decoration: const InputDecoration(
                labelText: 'Network',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: profile.username,
              onChanged: (value) => profile.username = value,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: profile.url,
              onChanged: (value) => profile.url = value,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Save/Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, profile);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorkEditor extends StatefulWidget {
  final Work? work;

  const WorkEditor({Key? key, this.work}) : super(key: key);

  @override
  _WorkEditorState createState() => _WorkEditorState();
}

class _WorkEditorState extends State<WorkEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final work = widget.work ?? Work('', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.company,
              onChanged: (value) => work.company = value,
              decoration: const InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.position,
              onChanged: (value) => work.position = value,
              decoration: const InputDecoration(
                labelText: 'Position',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.website,
              onChanged: (value) => work.website = value,
              decoration: const InputDecoration(
                labelText: 'Website',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.startDate,
              onChanged: (value) => work.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.endDate,
              onChanged: (value) => work.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: work.summary,
              onChanged: (value) => work.summary = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Highlights List with Add IconButton
            // Each highlight has a delete IconButton and can be edited inplace
            // Highlights are added to the work.highlights list
            Card(
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Highlights'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: work.highlights.length,
                    itemBuilder: (context, index) {
                      final highlight = work.highlights[index];
                      return ListTile(
                          title: TextField(
                            controller: TextEditingController(text: highlight),
                            onChanged: (value) =>
                                work.highlights[index] = value,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                work.highlights.removeAt(index);
                              });
                            },
                          ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        work.highlights.add('');
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Save/Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, work);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VolunteerEditor extends StatefulWidget {
  final Volunteer? volunteer;

  const VolunteerEditor({Key? key, this.volunteer}) : super(key: key);

  @override
  _VolunteerEditorState createState() => _VolunteerEditorState();
}

class _VolunteerEditorState extends State<VolunteerEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final volunteer = widget.volunteer ?? Volunteer('', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.organization,
              onChanged: (value) => volunteer.organization = value,
              decoration: const InputDecoration(
                labelText: 'Organization',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.position,
              onChanged: (value) => volunteer.position = value,
              decoration: const InputDecoration(
                labelText: 'Position',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.website,
              onChanged: (value) => volunteer.website = value,
              decoration: const InputDecoration(
                labelText: 'Website',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.startDate,
              onChanged: (value) => volunteer.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.endDate,
              onChanged: (value) => volunteer.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: volunteer.summary,
              onChanged: (value) => volunteer.summary = value,
              maxLines: 5,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Highlights List with Add IconButton
            // Each highlight has a delete IconButton and can be edited inplace
            // Highlights are added to the volunteer.highlights list
            Card(
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Highlights'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: volunteer.highlights.length,
                    itemBuilder: (context, index) {
                      final highlight = volunteer.highlights[index];
                      return ListTile(
                          title: TextField(
                            controller: TextEditingController(text: highlight),
                            onChanged: (value) =>
                                volunteer.highlights[index] = value,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                volunteer.highlights.removeAt(index);
                              });
                            },
                          ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        volunteer.highlights.add('');
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Save/Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, volunteer);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EducationEditor extends StatefulWidget {
  final Education? education;

  const EducationEditor({Key? key, this.education}) : super(key: key);

  @override
  _EducationEditorState createState() => _EducationEditorState();
}

class _EducationEditorState extends State<EducationEditor> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final education = widget.education ?? Education('', '', '');

    return Dialog(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.institution,
              onChanged: (value) => education.institution = value,
              decoration: const InputDecoration(
                labelText: 'Institution',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.area,
              onChanged: (value) => education.area = value,
              decoration: const InputDecoration(
                labelText: 'Area',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.studyType,
              onChanged: (value) => education.studyType = value,
              decoration: const InputDecoration(
                labelText: 'Study Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.startDate,
              onChanged: (value) => education.startDate = value,
              decoration: const InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.endDate,
              onChanged: (value) => education.endDate = value,
              decoration: const InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: education.gpa,
              onChanged: (value) => education.gpa = value,
              decoration: const InputDecoration(
                labelText: 'GPA',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Courses'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: education.courses.length,
                    itemBuilder: (context, index) {
                      final course = education.courses[index];
                      return ListTile(
                          title: TextField(
                            controller: TextEditingController(text: course),
                            onChanged: (value) =>
                                education.courses[index] = value,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                education.courses.removeAt(index);
                              });
                            },
                          ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        education.courses.add('');
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Save/Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, education);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
