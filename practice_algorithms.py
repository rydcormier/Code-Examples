# practice_algorithms.py
#
# Implements functions I saw on a recent skills test. A good way to practice
# and brush up on my python
#
# Ryan Cormier <rydcormier@gmail.com>
# 8/30/20
#

def deletion_distance(str1, str2, ascii=True):
    """Find the minimum deletion distance between two strings.

    Parameters:
        str1, str2  : str
            The strings to be compared.
        ascii   :   boolean optional
            Defaults to True, which computes the distance as the sum of the
            ASCII values of the characters deleted. Otherwise the distance
            is the number of characters deleted.

    Returns:
        int :   The minimum deletion distance to have str1 and str2 equal.
    """
    m = len( str1 )
    n = len( str2 )

    # use memoization
    d = [ [ 0 for i in range( n + 1 ) ] for j in range( m + 1 ) ]

    # set the base values
    for i in range( 1, m + 1 ):
        d[ i ][ 0 ] = d[ i - 1 ][ 0 ] + ord( str1[ i - 1 ] ) if ascii else 1
    for j in range( 1, n + 1 ):
        d[ 0 ][ j ] = d[ 0 ][ j - 1 ] + ord( str2[ j - 1 ] ) if ascii else 1

    # define d[ i ][ j ] from already computed values
    for i in range( 1, m + 1 ):
        for j in range( 1, n + 1 ):

            # match
            if str1[ i - 1 ] == str2[ j - 1 ]:
                d[ i ][ j ] = d[ i - 1 ][ j - 1 ]
            # no match: add distance
            else:
                d[ i ][ j ] = min( d[ i - 1 ][ j ] + ord( str1[ i - 1 ] ),
                                   d[ i ][ j - 1 ] + ord( str2[ j - 1 ] ) ) \
                    if ascii else 1 + min( d[ i - 1 ][ j ], d[ i ][ j - 1 ] )
    return d[ m ][ n ]


def interleave(str1, str2):
    """Interleave two strings into a single string.

    Parameters:
        str1, str2 : The strings to interleave.

    Returns:
        str : The combined string.
    """
    s = ''
    m = len( str1 )
    n = len( str2 )
    i = j = 0

    # keep adding a character from each string until they are all used
    while i < m or j < n:
        if i < m:
            s += str1[ i ]
            i += 1
        if j < n:
            s += str2[ j ]
            j += 1
    return s


def match_brackets(s):
    """Given a string containing brackets, find the number of brackets needed
    to balance the expression."""

    # track the balance between open and closed braces
    bal = 0

    for i in range( len( s ) ):
        if s[ i ] == '{':
            bal += 1
        elif s[ i ] == '}':
            bal -= 1

    # the number of needed brackets is the absolute value of bal
    return abs( bal )


def max_run(elements):
    """Find the maximum length of a continuously increasing or decreasing
    subsequence of elements.

    Parameters:
        elements:  a list of orderable objects.

    Returns:
        int: The length of the longest run of strictly increasing or decreasing
             values in elements.
    """

    # simple comparison function to determine if x < y, x == y, or x > y
    def cmp(x, y):
        if x < y:
            return -1
        if x > y:
            return 1
        return 0

    max_len = 0
    l = 1  # The current length of elements examining
    d = 0  # The "direction" of current run

    for i in range(1, len(elements)):
        c = cmp( elements[ i ], elements[ i - 1 ] )

        if c == 0:  # repeated value: reset
            l = 1
        elif l == 1 or d == c:  # good to continue
            l += 1
        else:  # switching direction: current length is now 2
            l = 2

        # update direction
        d = c
        # update max_len
        if l > max_len:
            max_len = l

    return max_len


