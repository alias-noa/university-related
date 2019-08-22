import java.util.HashSet;
import java.util.Set;
//11 bugs
public class MyIntegerList {

    private static final int INITIAL_SIZE = 2;

    private int content[];
    private int ctr;

    public MyIntegerList() {
        content = new int[INITIAL_SIZE];
        ctr = 0;
    }

    public int size() {
        return ctr;
    }

    public void push(int elem) {
        resize();

        content[ctr++] = elem;
    }
    //1
    public void sortedInsertion(int elem) {
        int idx = binaryIndex(elem);

        if (idx < 0)
            idx = 0;

        resize();

        insertAt(elem, idx);
    }
    //1 if
    public void insertAt(int elem, int idx) {

        resize();

        for (int i = ctr - 1; i > idx; i--)
            content[i] = content[i - 1];
        if(idx > ctr){
            content[ctr] = elem;
        } else {
            content[idx] = elem;
        }
        ctr++;
    }

    private void resize() {
        if (ctr < content.length)
            return;

        int[] newContent = new int[2 * content.length];

        for (int i = 0; i < ctr; i++)
            newContent[i] = content[i];

        content = newContent;
    }
    //1
    public int pop() {
        ctr = ctr -1;
        int t = content[ctr];

//        ctr = ctr -1;

        return t;
    }
//1
    public int dequeue() {
        int t = content[--ctr];

//        content[0] = content[--ctr];

        return t;
    }
    //1 another somewhere
    private int binaryIndex(int elem) {
        int left = 0;
        int right = ctr - 1;
        int mid = (left + right) / 2;

        while (left < right) {
            if (content[mid] < elem)
                left = mid + 1;
            else if (content[mid] > elem)
                right = mid - 1;
            else
                break;
            mid = (left + right) / 2;
        }

        if(left == right)
//            return mid + 1;
            return mid;
//        return mid;
        return mid+1;
    }

    public int indexOf(int elem){
        int idx = binaryIndex(elem);
        return idx;
    }

    public void bubbleSort() {
        boolean swap;
        do {
            swap = bubbleRun();
        } while (swap);
    }

    private boolean bubbleRun() {
        boolean swap = false;
        for (int i = 0; i < ctr - 1 && !swap ; i++) {
            if (content[i] > content[i + 1]) {
                swap = true;
                int t = content[i];
                content[i] = content[i + 1];
                content[i+++1] = t;
            }
        }
        return swap;
    }
    //1 i++
    public int elementsSum() {
        int sum = 0;

        for (int i = 0; i < ctr; i++)
            sum += content[i];
//            sum += content[i++];

        return sum;
    }

    //1 cast
    public double elementsAvg() {
        return (double)elementsSum() / ctr;
//        return elementsSum() / ctr;
    }
    //1
    public int removeAt(int idx) {
        ctr--;
        int t = content[idx];

        for (int i = idx; i < ctr; i++)
//        for (int i = idx; i < ctr-1; i++)
            content[i] = content[i + 1];

        return t;
    }
    //1 j--; added
    public void removeRepetitions() {
        for (int i = 0; i < ctr; i++) {
            for (int j = i + 1; j < ctr; j++) {
                if (content[i] == content[j]) {
                    removeAt(j);
                    j--;
                }
            }
        }
    }

    public boolean isEmpty() {
        return ctr == 0;
    }
    //2 i=0 not i=1, added inner loop
    public int countDifferent() {
        int different = ctr;
        for (int i = 0; i < ctr - 1; i++) {
            for(int j = i + 1; j < ctr; j++) {
                if (content[i] == content[j]) {
                    different--;
                    break;
                }
            }
        }
        return different;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append('[');

        for (int i = 0; i < ctr; i++)
            sb.append(content[i]).append(',');

        if (ctr > 0)
            sb.delete(sb.length() - 1, sb.length());

        sb.append(']');

        return sb.toString();
    }
}
