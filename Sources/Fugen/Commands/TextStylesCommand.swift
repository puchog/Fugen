import Foundation
import SwiftCLI

final class TextStylesCommand: StepCommand {

    // MARK: - Instance Properties

    let name = "textStyles"
    let shortDescription = "Generates code for text styles from a Figma file."

    let fileKey = Key<String>(
        "--fileKey",
        description: """
            Figma file key to generate text styles from.
            """
    )

    let includedNodes = VariadicKey<String>(
        "--includingNodes",
        "-i",
        description: #"""
            A list of Figma nodes whose styles will be extracted.
            Can be repeated multiple times and must be in the format: -i "1:23".
            If omitted, all nodes will be included.
            """#
    )

    let excludedNodes = VariadicKey<String>(
        "--excludingNodes",
        "-e",
        description: #"""
            A list of Figma nodes whose styles will be ignored.
            Can be repeated multiple times and must be in the format: -e "1:23".
            """#
    )

    let accessToken = Key<String>(
        "--accessToken",
        description: """
            A personal access token to make requests to the Figma API.
            Get more info: https://www.figma.com/developers/api#access-tokens
            """
    )

    let templatePath = Key<String>(
        "--templatePath",
        description: """
            Path to the template file.
            If no template is passed a default template will be used.
            """
    )

    let templateOptions = VariadicKey<String>(
        "--options",
        "-o",
        description: #"""
           An option that will be merged with template context, and overwrite any values of the same name.
           Can be repeated multiple times and must be in the format: -o "name:value".
           """#
    )

    let destinationPath = Key<String>(
        "--destinationPath",
        description: """
            The path to the file to generate.
            By default, generated code will be printed on stdout.
            """
    )

    let generator: TextStylesGenerator

    // MARK: - Initializers

    init(generator: TextStylesGenerator) {
        self.generator = generator
    }
}