<%*
// Project Creator Script
const projectName = await tp.system.prompt("Enter project name");
if (!projectName) return;

// Create slug from project name
const projectSlug = projectName.toLowerCase().replace(/\s+/g, '-').replace(/[^\w-]+/g, '');

// Create project folder
const projectFolder = `projects/${projectSlug}`;
await app.vault.createFolder(projectFolder).catch(() => console.log("Folder already exists"));

// Create project files with consistent naming convention
await tp.file.create_new(tp.file.find_tfile("templates/project-hub-template.md"), `hub-${projectSlug}`, false, projectFolder);
await tp.file.create_new(tp.file.find_tfile("templates/project-doc-template.md"), `doc-${projectSlug}`, false, projectFolder);

// Open the hub file
const hubPath = `${projectFolder}/hub-${projectSlug}.md`;
app.workspace.openLinkText(hubPath, "", true);
_%>

# Project Creator

Run this template to create a new project structure.

