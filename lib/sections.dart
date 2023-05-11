import 'package:flutter/material.dart';
import 'package:synapse/resume.dart';

import 'dart:convert';
import 'dart:io';

class ResumesSection extends StatefulWidget {
  const ResumesSection({Key? key}) : super(key: key);

  @override
  State<ResumesSection> createState() => _ResumesSectionState();
}

class _ResumesSectionState extends State<ResumesSection> {
  List<Resume> resumes = [];

  @override
  void initState() {
    super.initState();
    _loadResumes();
  }

  void _loadResumes() async {
    final file = File('data/resumes.json');
    final json = jsonDecode(await file.readAsString());
    setState(() {
      resumes = json.map<Resume>((e) => Resume.fromJson(e)).toList();
    });
  }

  void _createResume() {
    //Open the editor
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResumeEditor(
                resume: Resume(resumeName: 'New Resume'),
                onSaved: (resume) => _saveResume(resume))));
  }

  void _saveResume(Resume resume) {
    //Save the resume
    setState(() {
      resumes.add(resume);
    });
  }

  void _editResume(Resume resume) {
    //Open the editor
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResumeEditor(
                resume: resume, onSaved: (resume) => _saveResume(resume))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: _createResume,
        child: const Text('Create Resume'),
      ),
      Expanded(
          child: ListView.builder(
        itemCount: resumes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(resumes[index].resumeName),
              subtitle: Text(resumes[index].resumeId),
              trailing: Icon(Icons.more_vert),
              onTap: () => _editResume(resumes[index]),
            ),
          );
        },
      ))
    ]);
  }
}

class ApplicationsSection extends StatelessWidget {
  const ApplicationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('Application $index'),
            subtitle: Text('Application $index'),
            trailing: Icon(Icons.more_vert),
          ),
        );
      },
    ));
  }
}

class InsightsSection extends StatelessWidget {
  const InsightsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('Insight $index'),
            subtitle: Text('Insight $index'),
            trailing: Icon(Icons.more_vert),
          ),
        );
      },
    ));
  }
}
