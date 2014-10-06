Active-Learning-Cost
====================


<h2>Active Learning:</h2>
<p>A major problem of streaming data classification is the sample labeling. To solve that problem we can use less than 1% of data to train a classifier. Using this classifier to select most valuable data need labeling. Thus we can use a small data-set(less than 10%) containing most information to gain a better accuracy than that of randomly selecting a large data-set(more than 80%) which also require more labeling work.</p>
<center>
<img src="http://www-scf.usc.edu/~wenjiaxi/aacc.png" height=300 width=300>
</center>
<h2>Cost Frame</h2>

<p>The cost of an active learning instance is made up by 2 parts: labeling cost and miss-classification cost,
With the growing of data amount, the accuracy will increase which reduce the miss-classification cost. However, the labeling cost will raises. So need to get a balance to minimize the total cost. </p>
<center>
<img src="http://www-scf.usc.edu/~wenjiaxi/cost.png" height=300 width=300>
</center>
<h2>Ensemble:</h2>

<p>After training a lot of classifier through the past data, we do not want to discard that information. Also if the real world model changes we do not want the past information have effect on new model. So we choose different ways to ensemble the classifier togather</p>
<center>
<img src="http://www-scf.usc.edu/~wenjiaxi/ensemble.png" height=300 width=300>
</center>
