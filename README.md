# Aufgabe 4: Metadaten


### Kontext:

Metadaten beschreiben einen Datensatz und geben hilfreiche zusätzliche Informationen (z.B. zu Quellen, Lizenzen, Inhalten, etc...). Ein standardisiertes Format wird von der [OEF][oef-github] vorgeschlagen: [OEMetadaten (v1.4.0)][oemetadaten].

Um mit den Daten der Forschungsanlage [SonnJa!][sonnja-projekt] zu arbeiten nutzen wir eine Datenbank. 
Durch das Ausführen der [SQL-Skripte][htw-pv3-weatherdata] in PgAdmin4 wird die Datenbank initialisiert und mit [Daten][sonnja-data] befüllt.


### Aufgaben:

- Sichten Sie die Skripte und versuchen Sie die Kommandos nachzuvollziehen.
- Die Metadaten in Skript 4 entsprechen der OEMetadaten-Format v.1.3.0.
    - aktualliseren Sie das Format.
- Untersuchen Sie Skript 5 auf fehlende Metadaten.
    - Recherchieren Sie die fehldenden Metadaten falls möglich.
    - hierbei können Sie sich an den vorhandenen Metadaten im Skript orientieren.

### Hinweise: 

- Entsprechende Stellen sind in den Skripten markiert.
- Arbeiten Sie kollaborativ mit den, Ihnen zu Verfügung stehenden, Tools.
- Prüfen Sie Ihre Ergebnisse gegenseitig: Jeder kann Fehler machen!
- Sammeln Sie die Metadaten jeweils in einer .json-Datei und geben Sie diese mit ab.
- Dokumentieren Sie Ihr Vorgehen und ihre durchgeführte Arbeit kurz in schriftlicher Form.
- Nutzen Sie das [Metadaten Wiki][meta-wiki].
- Nutzen Sie folgenden JSON-String:

---

    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "ludwig.huelk@rl-institut.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"},


[//]: # (Quellen:)


[oemetadaten]: https://github.com/OpenEnergyPlatform/metadata/tree/develop/metadata/v140 "OEMetadaten v.1.4.0"
[oef-github]: https://github.com/OpenEnergyPlatform/organisation/blob/master/README.md "Open Energy Family"
[htw-pv3-weatherdata]: https://github.com/htw-pv3/weather-data/tree/master "Github Repo"
[oep]: https://openenergy-platform.org/ "Open Energy Platform"
[sonnja-projekt]: http://einleuchtend.org/sonn-ja/das-projekt/ "Einleuchtend e.V. SonnJa!"
[sonnja-data]: https://next.rl-institut.de/s/LJXYzBDyC5aDJtz "Sonnja Dataset"
[meta-wiki]: https://github.com/OpenEnergyPlatform/metadata/wiki "Metadaten Wiki"

