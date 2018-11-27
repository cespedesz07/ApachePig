from pig_util import outputSchema

months = ['ene', 'feb', 'mar', 'abr',
		  'may', 'jun', 'jul', 'ago',
		  'sep', 'oct', 'nov', 'dic']
days = ['lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo']

@outputSchema("monthname:chararray")
def getMonthInSpanish	( monthIndex ):
	return months[ int(monthIndex) - 1 ];

@outputSchema("monthname:chararray")
def getDayInSpanish( dayIndex ):
	return days[ int(dayIndex) - 1 ];