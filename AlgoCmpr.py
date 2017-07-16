# coding: utf-8

import numpy as np
import matplotlib.pyplot as plt


def cmp_fig(_from, _to, _step):
	plt.figure(u'算法效率比较')
	n = np.linspace(_from, _to, _step)
	f1 = n * n
	f2 = 2 * n * np.log2(n)
	plot1 = plt.plot(n, f1, 'g--', label='Original Algorithm')
	plot2 = plt.plot(n, f2, 'g', label='Improved Algorithm')
	plt.legend()
	plt.xlabel(u"Number of Routes")
	plt.ylabel(u"Computing Time")
	plt.title(u"Algorithm Comparison")
	plt.show()


if __name__ == '__main__':
	cmp_fig(0, 1000, 50)