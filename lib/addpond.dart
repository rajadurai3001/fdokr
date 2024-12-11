import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ParameterSelectionPage extends StatefulWidget {
  const ParameterSelectionPage({super.key});

  @override
  _ParameterSelectionPageState createState() =>
      _ParameterSelectionPageState();
}

class _ParameterSelectionPageState extends State<ParameterSelectionPage> {
  // Parameters and their states
  Map<String, bool> parameters = {
    'PH': false,
    'DO': false,
    'Salinity': false,
    'Temperature': false,
    'Other': false,
  };

  // Function to submit data to Firebase
  Future<void> submitData() async {
    // Get selected parameters
    final selectedParameters = parameters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Check if no parameter is selected
    if (selectedParameters.isEmpty) {
      // Show a message to select at least one parameter
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose at least one parameter!')),
      );
      return;
    }

    // Save to Firebase Firestore
    await FirebaseFirestore.instance.collection('selected_parameters').add({
      'parameters': selectedParameters,
      'timestamp': DateTime.now(),
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data submitted successfully!')),
    );

    // Reset selections
    setState(() {
      parameters.updateAll((key, value) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/homepage.jpg'),
          fit: BoxFit.cover
          )
          
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Parameters:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Dynamic list of checkboxes
              ...parameters.keys.map((key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: parameters[key],
                  onChanged: (value) {
                    setState(() {
                      parameters[key] = value ?? false;
                    });
                  },
                );
              }),
              const Spacer(),
              // Submit Button
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: submitData,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Center(
                    child: Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ParameterSelectionPage(),
  ));
}
