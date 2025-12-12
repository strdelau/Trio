import SwiftUI

struct TempTargetHelpView: View {
    var state: Adjustments.StateModel
    var helpSheetDetent: Binding<PresentationDetent>

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(
                            "A Temporary Target replaces the current Target Glucose specified in Therapy settings."
                        )
                        Text(
                            "Depending on your Target Behavior settings (see Settings > the Algorithm > Target Behavior), these temporary glucose targets can also raise Insulin Sensitivity for high targets or lower sensitivity for low targets."
                        )
                        Text(
                            "Furthermore, you could adjust that sensitivity change independently from the Half Basal Exercise Target specified in Algorithm > Target Behavior settings by deliberately setting a customized Insulin Percentage for a Temp Target."
                        )
                        Text(
                            "A pre-condition to have Temp Targets adjust Sensitivity is that the respective Target Behavior settings High Temp Target Raises Sensitivity or Low Temp Target Lowers Sensitivity are set to enabled."
                        )
                    }
                } header: {
                    Text("Overview")
                }
                .listRowBackground(Color.gray.opacity(0.1))

                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(
                            "Sensitivity adjustments from Temp Targets have a hard-coded minimum of 15%. This means even very high Temp Targets cannot reduce insulin delivery below 15% of normal."
                        )
                        Text(
                            "This 15% floor is a safety limit inherited from oref (OpenAPS reference design) and AndroidAPS. It prevents Temp Targets from reducing insulin to dangerously low levels."
                        )
                        Text(
                            "Note: Autosens Min and Autosens Max settings do not apply symmetrically to Temp Target sensitivity adjustments. Autosens Max limits how much sensitivity can be decreased (more insulin), but Autosens Min does not override the 15% floor for increased sensitivity (less insulin)."
                        )
                        Text(
                            "This asymmetry exists because reducing insulin delivery during exercise, normally realized by using high Temp Targets, typically requires a higher insulin reduction than what autosens would identify in a regular dayly routine."
                        )
                    }
                } header: {
                    Text("Sensitivity Limits")
                }
                .listRowBackground(Color.gray.opacity(0.1))
            }
            .navigationBarTitle("Help", displayMode: .inline)

            Button { state.isHelpSheetPresented.toggle() }
            label: { Text("Got it!").bold().frame(maxWidth: .infinity, minHeight: 30, alignment: .center) }
                .buttonStyle(.bordered)
                .padding(.top)
        }
        .padding()
        .scrollContentBackground(.hidden)
        .presentationDetents(
            [.fraction(0.9), .large],
            selection: helpSheetDetent
        )
    }
}
