import java.util.Scanner;

ArrayList<Lista> listas = new ArrayList<Lista>();
ArrayList<Pilha> pilhas =  new ArrayList<Pilha>();

Scanner scan = new Scanner(System.in);

boolean pilha = false;

PImage listaInst;
PImage pilhaInst;

void setup() {

  size(1280, 720);

  listaInst = loadImage("lista_inst.png");
  pilhaInst = loadImage("pilha_inst.png");

  int n = int(random(50));

  if (!pilha)
    listas.add(new Lista(n));

  else {
    pilhas.add(new Pilha(n));
    //pilhas.get(0).show();
  }
}

void draw() {

  if (!pilha) {

    background(233, 159, 122);

    image(listaInst, width/2, height/2);

    textSize(24);
    textAlign(CENTER, CENTER);
    text("Linked List mode", width - 150, 50);

    //if (listas.size() < 1) {
    //  listas.add(new Lista(int(random(50))));
    //}

    int i = 0;
    if (listas.size() > 0) {
      for (Lista l : listas) {
        l.showL(listas.size(), i+1); 
        i++;
      }
    }
  }

  //PILHA --------------------------------

  else {

    background(32, 178, 170);

    image(pilhaInst, width/2, height/2);

    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Stack mode", width - 100, 50);

    //if (pilhas.size() < 1) {
    //  pilhas.add(new Pilha(int(random(50))));
    //}

    int j = 0;

    for (Pilha p : pilhas) {
      p.showP(pilhas.size(), j+1);
      //p.show();
      j++;
    }

    //if (frameCount % 100 == 0) {
    //  pilhas.add(new Pilha(3));
    //}
  }
}

//END OF DRAW --------------------------------------

void keyPressed() {

  //int n = int(random(50));

  // LISTA--------------------------------------
  if (pilha == false) {
    if (key == 'i' || key == 'I') {
      //int numero = scan.nextInt();
      //System.out.println(numero);
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(242, height - 27, 210, 40);
      for (Lista l : listas) {
        l.insereIn(int(random(50)));
      }
    } else if (key == 'f' || key == 'F') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(502, height - 27, 210, 40);
      for (Lista l : listas) {
        l.insereFim(int(random(50)));
      }
    } else if (key == 'r' || key == 'R') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(762, height - 27, 220, 40);
      for (Lista l : listas) {
        l.retiraIn();
      }
    } else if (key == 'e' || key == 'E') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(1015, height - 27, 220, 40);
      for (Lista l : listas) {
        l.retiraFim();
      }
    } else if (key == 'l' || key == 'L') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(453, 27, 245, 40);
      listas.add(new Lista(int(random(50))));
    } else if (key == 'j' || key == 'J') {
      if (listas.size() > 0){
        noFill();
        stroke(255);
        rectMode(CENTER);
        rect(805, 27, 210, 40);
        listas.remove(listas.size()-1);
      }
    } else if (key == 's' || key == 'S') {
      if ((listas.size() == 1 && listas.get(0).size() == 0) || listas.size() < 1 ){
        noFill();
        stroke(255);
        rectMode(CENTER);
        rect(1157, 87, 200, 40);
        pilha = true;
        pilhas.add(new Pilha(int(random(50))));
      }
    }
  }

  //PILHA -----------------------------------------

  else {

    if (key == 'i' || key == 'I') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(527, height - 30, 120, 40);
      for (Pilha p : pilhas) {
        p.insere(int(random(50)));
      }
    } else if (key == 'r' || key == 'R') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(741, height - 30, 120, 40);
      for (Pilha p : pilhas) {
        p.retira();
      }
    } else if (key == 'p' || key == 'p') {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(267, height - 30, 250, 40);
      pilhas.add(new Pilha(int(random(50))));
    } else if (key == 'o' || key == 'O') {
      if (pilhas.size() > 0){
        noFill();
        stroke(255);
        rectMode(CENTER);
        rect(1024, height - 30, 230, 40);
        pilhas.remove(pilhas.size()-1);
      }
    } else if (key == 's' || key == 'S') {
      if ((pilhas.size() == 1 && pilhas.get(0).size() == 0) || pilhas.size() < 1){
        noFill();
        stroke(255);
        rectMode(CENTER);
        rect(1157, 87, 200, 40);
        pilha = false;
        listas.add(new Lista(int(random(50))));
      }
    }
  }
}


void mousePressed() {
  int n = int(random(50));

  if (pilha == false) {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(242, height - 27, 210, 40);
    
    for (Lista l : listas)
      l.insereIn(n);
  } else if (pilha == true) {
    if (pilhas.size() < 1) {
      pilhas.add(new Pilha(n));
    } else {
      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(527, height - 30, 120, 40);
      for (Pilha p : pilhas) {
        p.insere(n);
      }
    }
  }
}
