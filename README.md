# AnaliseExploratoria
Analisando os gráficos obtidos, observa-se inicialmente na 5C, no Histograma de Idade, uma alta frequência de indivíduos na faixa etária de 45 a 60 anos. Abaixo dos 25 também há uma frequência considerável. A faixa etária que apresenta menor incidência é a de indivíduos mais idosos, entre 85 a 100 anos.

Após análise do Boxlot do Tempo preso, para a 5D, Ficou claro que a mediana de tempo preso é de 60 meses, apresentando um limite inferior abaixo de 40 meses e um limite superior um pouco acima de 80. Além disso, evidencia-se a presença de um outlier, que indica a presença de um valor discrepante aos apresentados. Esse valor, nesse caso, está acima de 85 meses, perto de 90 meses, indicando a presença de um idivíduo preso por um tempo discrepante.

No boxplot do Score de Periculosidade por escolaridade, começo minha análise pelas medianas. Fica claro que indivíduos com nível fundamental de escolaridade, seguido pelos indivíduos de nível médio, tem a mediana do Score de Periculosidade mais elevada, por volta de 175 - 180, já os indivíduos com nível superior estão com a mediana abaixo do Score de 175, ou seja, apresentam um índice de periculosidade menor, comparado aos indivíduos do Fundamental e do Médio. Analisando o Quartil 3 (Q3), o grupo Fundamental e Médio tem um Q3 relativamente alto, ou seja, 25% dos indivíduos desses grupos possuem scores de periculosidade acima do valor da mediana, o que indica uma quantidade considerável de pessoas com alto índice de periculosidade. No grupo de nível Superior, o Q3 é um pouco menor, o que pode indicar menor concentração de indivíduos com scores muito altos.
Além disso, percebe-se a presença de dois outliers em indivíduos de nível médio.

Por fim, analisando o gráfico de barras da 5F, nota-se um valor consideravél de Não-Reincidentes.

Complementando o documento, abaixo estão as fórmulas utilizadas para cálculo de cada uma das tendências estatísticas. As fórmulas foram apresentadas por mim, porém para me ajudar a formatar de maneira visualmente adequada, busquei orientação https://docs.github.com/pt/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions nesse link para obter as expressões matematicas.

Média é a soma de todos os valores dividida pelo número total de observações.
* **Média ($\bar{x}$):** 
    $$\bar{x} = \frac{1}{n} \sum_{i=1}^{n} $$

* **Mediana:** É o valor central que divide o conjunto de dados em duas metades iguais. Para calculá-la, os dados devem ser ordenados.

* **Variância ($s^2$):** Mede o quão distante um conjunto de números está de sua média.
    $$s^2 = \frac{1}{n-1} \sum_{i=1}^{n} (x_i - \bar{x})^2$$

* **Desvio Padrão ($s$):** É a raiz quadrada da variância. Esta é a medida de dispersão mais utilizada, pois está na mesma unidade de medida que os dados originais, tornando a dispersão diretamente interpretável.
    $$s = \sqrt{\frac{1}{n-1} \sum_{i=1}^{n} (x_i - \bar{x})^2}$$

* **Amplitude:** É a diferença entre o valor máximo ($x_{\text{máx}}$) e o valor mínimo ($x_{\text{mín}}$) observados no conjunto de dados. É a medida de dispersão mais simples, mas muito afetada por *outliers*.
    $$\text{Amplitude} = x_{\text{máx}} - x_{\text{mín}}$$
