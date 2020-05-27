PRIMO DATASET: FINO AL 24-05-20
SECONDO DATASET: FINO AL 14-05-20
In entrambi i dataset le medie settimanali sono state calcolate considerando le settimane iniziando dal lunedì, per cui le medie sulle eventuali settimane iniziali e finali più corte sono calcolate sul numero di giorni di cui si hanno dati.
Il dato puntuale del primo giorno è calcolato riferito ad un dato fittizio "0".

I valori cumulativi ma non monotoni non decrescenti del Dataset 2 vengono corretti sostituendoli con la media tra il valore preceente e il primo valore successivo che sia maggiore o uguale al precedente. Ad esempio (32, 31, 31, 34) diventa (32, 33, 33.5, 34).

Per eseguire in locale le due applicazioni nelle due classi Query1 e Query2 porre la variabile "local" a true. Verranno usati i path dei dataset presenti nella cartella data.

Per l'esecuzione su cluster porre la variabile local a "false", e ci si aspettano come argomenti:
- i filepath di input
- quello di output 
- "true" o "false" per processare anche l'header o meno.

- Avviare un cluster EMR.
- Creare un bucket di nome sabdbucket.
Caricare jar, dataset e file dei continenti contenuti nella cartella data del progetto:
 sabd1Spark.sh
 SABDproject1-1.0-SNAPSHOT.jar
 dpc-covid19-ita-andamento-nazionale.csv .
 sabdbucket/time_series_covid19_confirmed_global.csv .
 sabdbucket/countryContinent.csv .

E' stato usato un file .sh, Sabd1Spark.sh per eseguire sul Master del Cluster EMR le operazionidi caricamento dei file dei Dataset da un bucket S3 al Master, e poi su una Directory dell'HDFS. Ache per sottomettere le applicazioni a Spark e caricarne il risultato nel bucket S3.
