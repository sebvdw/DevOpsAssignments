import unittest
import os
import csvprinter.main as csvprinter

class TestCSVInterpreter(unittest.TestCase):
    def test_ReadCSV(self):
        result = csvprinter.read_csv()
        self.assertEqual(len(result), 5462, "Length should be 5462 ...")
    def test_CreateGraph(self):
        result = csvprinter.read_csv()
        result = csvprinter.transform(result)
        csvprinter.create_graph(result)
        self.assertTrue(os.path.exists("chart.txt"))
    def test_Search(self):
        result = csvprinter.read_csv()
        searchResult = csvprinter.search(result, "Joe Swank")
        searchResult = csvprinter.transform(searchResult)
        self.assertEqual(searchResult, {'Joe Swank': 25}, "Sum should be five ...")

if __name__ == '__main__':
    unittest.main()