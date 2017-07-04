ISAAC's KOMET
======================
This repository is to provide for collaborative development of documentation for ISAAC's KOMET. 
Documentation project for:

#### ISAAC ####
Informatics Analytic Architecture—A dynamic semantic architecture for the analysis of models, logic, and language.
#### KOMET ####
Knowledge Management Environment—An environment to manage semantic knowledge related to models, logic, and language 
that are represented using the ISAAC architecture.  
#### SOLOR ####
An integration of SNOMED, LOINC, and RxNorm represented using ISAAC, and viewable and editable using KOMET.

### How do I get set up? ###

This is a maven/docbook project. To build, clone this repository locally, ensure maven is properly setup,
then run maven from the root directory of the cloned repository: 

    mvn clean install
    
Integrated pdf and html files for the entire project can be found in: 

    isaacs-komet-compendium/target/site/docbook/isaacs-komet-compendium.[xep.pdf|html|pdf]

Generated files for each module can be found in: 

    {moduleName}/target/site/docbook/{moduleName}.[xep.pdf|html|pdf]
